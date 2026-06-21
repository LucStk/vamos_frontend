import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/domain_core.dart';

import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/infrastructure/trip/data.dart';
import 'package:vamos_cartographie/infrastructure/trip/mappers/trip_draft_mappers.dart';
import 'package:vamos_cartographie/infrastructure/trip/trip_remote_datasource.dart';
import 'package:trip_domain/trip_domain.dart';

class TripRepository {
  final TripRemoteDatasource remote;

  TripRepository(this.remote);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

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

  Future<Either<Failure, Trip>> getTrip(Id<Trip> id) async {
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

  Future<Either<Failure, Trip>> createTrip(TripDraft trip) async {
    try {
      final input = TripDraftMapper.toGQLInput(trip);
      final gqlResult = await remote.createTrip(input: input);
      final createdTrip = TripMapper.fromGQLCreateResult(gqlResult);
      final tripId = createdTrip.id;

      // Après création, aucune image n'est encore attachée côté serveur.
      // On attache toutes les images présentes dans le modèle local.
      final attachedImages = await _attachImages(
        tripId: tripId,
        desired: trip.images,
        alreadyAttached: const {},
      );

      return Right(_rebuildWithImages(createdTrip, attachedImages.toList()));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, Trip>> updateTrip(Id<Trip> id, TripDraft trip) async {
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

  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    try {
      await remote.deleteTrip(id: id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Set<MediaImage>> _attachImages({
    required Id<Trip> tripId,
    required List<MediaImage> desired,
    required Set<MediaImage> alreadyAttached,
  }) async {
    final attached = <MediaImage>{...alreadyAttached};
    final attachedFileKeys = attached.map((i) => i.fileKey).toSet();

    for (final image in desired) {
      if (attachedFileKeys.contains(image.fileKey)) continue;
      try {
        await remote.attachImageToTrip(tripId: tripId, fileKey: image.fileKey);
        attached.add(image);
        attachedFileKeys.add(image.fileKey);
      } catch (_) {}
    }

    return attached;
  }

  /// Supprime sur le serveur toutes les images de [toRemove].
  /// Les erreurs sont ignorées silencieusement (la suppression pourra être
  /// retentée à la prochaine sauvegarde).
  Future<void> _deleteImages({
    required Id<Trip> tripId,
    required List<MediaImage> toRemove,
  }) async {
    for (final image in toRemove) {
      await remote.deleteImgFromTrip(tripId: tripId, fileKey: image.fileKey);
    }
  }

  /// Reconstruit un [Trip] domaine en remplaçant sa liste d'images.
  Trip _rebuildWithImages(Trip source, List<MediaImage> images) => Trip(
    id: source.id,
    title: source.title,
    description: source.description,
    date: source.date,
    images: images,
  ); // data/repositories/trip_repository.dart
}
