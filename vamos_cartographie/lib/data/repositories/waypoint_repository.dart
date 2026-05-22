import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/data/mappers/trip_mappers.dart';
import 'package:vamos_cartographie/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import 'i_waypoint_repository.dart';

class WaypointRepository implements IWaypointRepository {
  final WaypointRemoteDatasource remote;
  final UploadImgRepository imageRepo;

  WaypointRepository(this.remote, this.imageRepo);

  @override
  Future<Either<Failure, Waypoint>> updateWaypoint(
    int waypointId,
    int tripId,
  ) async {
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
}
