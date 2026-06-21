import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/vertex.dart';
import 'package:vamos_cartographie/backend/topology/mappers/vertex_mappers.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/mappers.dart';
import "package:latlong2/latlong.dart";
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

class WaypointRepository {
  final WaypointRemoteDatasource remote;

  WaypointRepository(this.remote);

  Future<Either<Failure, List<Waypoint>>> getWaypoints(Id<Trip> tripId) async {
    try {
      final waypoints = await remote.getWaypoints(tripId: tripId);
      final ret = waypoints.map((w) => WaypointMapper.fromGQL(w)).toList();
      return Right(ret);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, CreateWaypointResult>> createWaypoint(
    Id<Trip> tripId,
    WaypointDraft waypointDraft,
    Id<Vertex>? vertexId,
    LatLng? latLng,
  ) async {
    try {
      // Then create the waypoint with the vertex ID
      final input = WaypointDraftMapper.toGQLInput(
        waypointDraft,
        vertexId,
        latLng,
      );
      final gqlResult = await remote.createWaypoint(
        tripId: tripId,
        input: input,
      );
      final createWaypoint = WaypointMapper.fromGQL(gqlResult.waypoint);
      final waypointVertex = VertexMapper.fromGQL(gqlResult.vertex);
      final attachedImages = await _attachImages(
        waypointId: createWaypoint.id,
        desired: waypointDraft.images,
        alreadyAttached: const {},
      );
      final rebuilt = _rebuildWithImages(
        createWaypoint,
        attachedImages.toList(),
      );
      return Right(
        CreateWaypointResult(waypoint: rebuilt, vertex: waypointVertex),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, Waypoint>> updateWaypoint(
    Id<Waypoint> id,
    WaypointDraft waypoint,
  ) async {
    try {
      final input = WaypointDraftMapper.toGQLUpdateInput(waypoint);
      final gqlResult = await remote.updateWaypoint(id: id, input: input);
      final updatedWaypoint = WaypointMapper.fromGQL(gqlResult);

      final alreadyAttached = gqlResult.images
          .map((i) => MediaImage(fileKey: i.image.fileKey, url: i.image.url))
          .toSet();

      final attachedImages = await _attachImages(
        waypointId: id,
        desired: waypoint.images,
        alreadyAttached: alreadyAttached,
      );

      // On supprime les images présentes sur le serveur mais absentes localement
      // (supprimées par l'utilisateur).
      final desiredFileKeys = waypoint.images.map((i) => i.fileKey).toSet();
      final toDelete = alreadyAttached
          .where((i) => !desiredFileKeys.contains(i.fileKey))
          .toList();
      await _deleteImages(waypointId: id, toRemove: toDelete);

      // La liste finale exclut les images supprimées.
      final finalImages = attachedImages
          .where((i) => desiredFileKeys.contains(i.fileKey))
          .toList();
      return Right(_rebuildWithImages(updatedWaypoint, finalImages));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Either<Failure, void>> deleteWaypoint(Id<Waypoint> id) async {
    try {
      await remote.deleteWaypoint(id: id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (_) {
      return Left(const ConnectionFailure());
    }
  }

  Future<Set<MediaImage>> _attachImages({
    required Id<Waypoint> waypointId,
    required List<MediaImage> desired,
    required Set<MediaImage> alreadyAttached,
  }) async {
    final attached = <MediaImage>{...alreadyAttached};
    final attachedFileKeys = attached.map((i) => i.fileKey).toSet();

    for (final image in desired) {
      if (attachedFileKeys.contains(image.fileKey)) continue;
      try {
        await remote.attachImageToWaypoint(
          waypointId: waypointId,
          fileKey: image.fileKey,
        );
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
    required Id<Waypoint> waypointId,
    required List<MediaImage> toRemove,
  }) async {
    for (final image in toRemove) {
      await remote.deleteImgFromWaypoint(
        waypointId: waypointId,
        fileKey: image.fileKey,
      );
    }
  }

  /// Reconstruit un [Trip] domaine en remplaçant sa liste d'images.
  Waypoint _rebuildWithImages(Waypoint source, List<MediaImage> images) =>
      Waypoint(
        id: source.id,
        vertexId: source.vertexId,
        title: source.title,
        description: source.description,
        images: images,
        poiCategory: source.poiCategory,
      ); // data/repositories/trip_repository.dart
}
