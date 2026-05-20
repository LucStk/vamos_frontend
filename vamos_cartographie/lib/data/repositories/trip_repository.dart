import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/domain/domain.dart';
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
      final attachedFileKeys = await _attachImages(
        tripId: tripId,
        desired: trip.images,
        alreadyAttached: const {},
      );

      return Right(_rebuildWithImages(createdTrip, attachedFileKeys));
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
          .map((i) => i.image.fileKey)
          .toSet();

      // On n'attache que les images nouvelles (présentes localement mais pas
      // encore sur le serveur).
      final attachedFileKeys = await _attachImages(
        tripId: id,
        desired: trip.images,
        alreadyAttached: alreadyAttached,
      );

      // Liste finale = images déjà sur le serveur + nouvelles attachées.
      final finalImages = {...alreadyAttached, ...attachedFileKeys}.toList();
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
  /// Retourne la liste des fileKeys effectivement attachés (+ ceux déjà là).
  Future<List<String>> _attachImages({
    required int tripId,
    required List<String> desired,
    required Set<String> alreadyAttached,
  }) async {
    final attached = <String>{...alreadyAttached};

    for (final fileKey in desired) {
      if (attached.contains(fileKey)) continue;
      final result = await imageRepo.attachImageToTrip(
        tripId: tripId,
        fileKey: fileKey,
      );
      result.fold(
        // Erreur ignorée : on conserve le fileKey dans la liste locale afin
        // que l'UI reste cohérente et que la tentative puisse être rejouée.
        (_) => null,
        (_) => attached.add(fileKey),
      );
    }

    return attached.toList();
  }

  /// Reconstruit un [Trip] domaine en remplaçant sa liste d'images.
  Trip _rebuildWithImages(Trip source, List<String> images) => Trip(
    id: source.id,
    title: source.title,
    description: source.description,
    date: source.date,
    images: images,
    waypoints: source.waypoints,
    segments: source.segments,
  );
}
