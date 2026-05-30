import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/trips/data/datasources/datasources.dart';
import 'package:vamos_cartographie/features/trips/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/features/trips/data/mappers/trip_draft_mappers.dart';
import 'package:vamos_cartographie/features/media/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/images_sync.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'images_sync.dart';
import 'i_trip_repository.dart';

class TripRepository implements ITripRepository {
  final TripRemoteDatasource remote;
  final ImagesSync imagesSync;

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, List<Trip>>> getAllTrips() async {
    try {
      final gqlTrips = await remote.getAllTrips();
      return Right(gqlTrips.map(TripMapper.fromGQLFields).toList());
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> getTrip(int id) async {
    try {
      final gqlTrip = await remote.getTripById(id: id);
      return Right(TripMapper.fromGQLDetail(gqlTrip));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  // ---------------------------------------------------------------------------
  // Mutations
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, Trip>> createTrip(TripDraft trip) async {
    try {
      final input = TripDraftMapper.toGQLInput(trip);
      final gqlResult = await remote.createTrip(input: input);
      final createdTrip = TripMapper.fromGQLCreateResult(gqlResult);
      final tripId = createdTrip.id;

      // Après création, aucune image n'est encore attachée côté serveur.
      // On attache toutes les images présentes dans le modèle local.
      final attachedImages = await attachImages(
        tripId: tripId,
        desired: trip.images,
        alreadyAttached: const {},
      );

      return Right(rebuildWithImages(createdTrip, attachedImages.toList()));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Trip>> updateTrip(int id, TripDraft trip) async {
    try {
      final input = TripDraftMapper.toGQLUpdateInput(trip);
      final gqlResult = await remote.updateTrip(id: id, input: input);
      final updatedTrip = TripMapper.fromGQLUpdateResult(gqlResult);

      // Les images déjà attachées côté serveur (retournées par la mutation).
      final alreadyAttached = gqlResult.images
          .map((i) => MediaImage(fileKey: i.image.fileKey, url: i.image.url))
          .toSet();

      // On n'attache que les images nouvelles (présentes localement mais pas
      // encore sur le serveur).
      final attachedImages = await _attachImages(
        tripId: id,
        desired: trip.images,
        alreadyAttached: alreadyAttached,
      );

      // On supprime les images présentes sur le serveur mais absentes localement
      // (supprimées par l'utilisateur).
      final desiredFileKeys = trip.images.map((i) => i.fileKey).toSet();
      final toDelete = alreadyAttached
          .where((i) => !desiredFileKeys.contains(i.fileKey))
          .toList();
      await _deleteImages(tripId: id, toRemove: toDelete);

      // La liste finale exclut les images supprimées.
      final finalImages = attachedImages
          .where((i) => desiredFileKeys.contains(i.fileKey))
          .toList();
      debugPrint("update_trip_images $finalImages");
      return Right(_rebuildWithImages(updatedTrip, finalImages));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTrip(int id) async {
    try {
      await remote.deleteTrip(id: id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }
}
