import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/domain/trip_image.dart';
import 'i_trip_repository.dart';

/// Implémentation concrète de [ITripRepository].
///
/// Délègue les appels réseau à [TripRemoteDatasource] et utilise [TripMapper]
/// pour convertir les types GQL ↔ domaine.
///
/// Après chaque création ou mise à jour d'un trip, les images présentes dans
/// [Trip.images] mais pas encore associées côté serveur sont attachées via
/// [UploadImgRepository.attachImageToTrip].
class TripRepository implements ITripRepository {
  final TripRemoteDatasource remote;
  final UploadImgRepository imageRepo;

  TripRepository(this.remote, this.imageRepo);

  // ---------------------------------------------------------------------------
  // Queries
  // ---------------------------------------------------------------------------

  @override
  Future<Either<Failure, List<Trip>>> getAllTrips() async {
    try {
      final gqlTrips = await remote.getAllTrips();
      return Right(gqlTrips.map(TripMapper.tripFromGQLFields).toList());
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
      return Right(TripMapper.tripFromGQLDetail(gqlTrip));
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
  Future<Either<Failure, Trip>> createTrip(Trip trip) async {
    try {
      final input = TripMapper.tripToGQLInput(trip);
      final gqlResult = await remote.createTrip(input: input);
      final createdTrip = TripMapper.tripFromGQLCreateResult(gqlResult);
      final tripId = createdTrip.id!;

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

  @override
  Future<Either<Failure, Trip>> updateTrip(int id, Trip trip) async {
    try {
      final input = TripMapper.tripToGQLUpdateInput(trip);
      final gqlResult = await remote.updateTrip(id: id, input: input);
      final updatedTrip = TripMapper.tripFromGQLUpdateResult(gqlResult);

      // Les images déjà attachées côté serveur (retournées par la mutation).
      final alreadyAttached = gqlResult.images
          .map((i) => TripImage(fileKey: i.image.fileKey, url: i.image.url))
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

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Attache à [tripId] toutes les images de [desired] qui ne sont pas encore
  /// dans [alreadyAttached]. Les erreurs d'attachement sont ignorées
  /// silencieusement (l'image reste dans le modèle local, l'opération peut
  /// être rejouée à la prochaine sauvegarde).
  ///
  /// Retourne l'ensemble des [TripImage] effectivement attachés (+ ceux déjà là).
  Future<Set<TripImage>> _attachImages({
    required int tripId,
    required List<TripImage> desired,
    required Set<TripImage> alreadyAttached,
  }) async {
    final attached = <TripImage>{...alreadyAttached};
    final attachedFileKeys = attached.map((i) => i.fileKey).toSet();

    for (final image in desired) {
      if (attachedFileKeys.contains(image.fileKey)) continue;
      final result = await imageRepo.attachImageToTrip(
        tripId: tripId,
        fileKey: image.fileKey,
      );
      result.fold(
        // Erreur ignorée : on conserve l'image dans la liste locale afin
        // que l'UI reste cohérente et que la tentative puisse être rejouée.
        (_) => null,
        (_) {
          attached.add(image);
          attachedFileKeys.add(image.fileKey);
        },
      );
    }

    return attached;
  }

  /// Supprime sur le serveur toutes les images de [toRemove].
  /// Les erreurs sont ignorées silencieusement (la suppression pourra être
  /// retentée à la prochaine sauvegarde).
  Future<void> _deleteImages({
    required int tripId,
    required List<TripImage> toRemove,
  }) async {
    for (final image in toRemove) {
      await remote.deleteImgTrip(tripId: tripId, fileKey: image.fileKey);
    }
  }

  /// Reconstruit un [Trip] domaine en remplaçant sa liste d'images.
  Trip _rebuildWithImages(Trip source, List<TripImage> images) => Trip(
    id: source.id,
    title: source.title,
    description: source.description,
    date: source.date,
    images: images,
    waypoints: source.waypoints,
    segments: source.segments,
  );
}
