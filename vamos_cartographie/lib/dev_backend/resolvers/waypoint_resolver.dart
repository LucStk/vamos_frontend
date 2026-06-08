import 'package:vamos_cartographie/features/media/domain/entities/carousel_item.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/dev_backend/mapping/gql_mappers.dart";

/// Résout les opérations GraphQL relatives aux waypoints.
class WaypointResolver {
  final FakeGraphQLStore store;

  WaypointResolver(this.store);

  // ── Queries ──────────────────────────────────────────────────────────────────

  Map<String, dynamic> getWaypoints(int tripId) {
    final base = store.trip(tripId);
    final waypoints = store.waypoints(tripId).map((w) {
      return waypointToGql(w, store.vertex(w.vertexId));
    }).toList();

    return GGetWaypointsData(
      trip: GGetWaypointsData_trip(
        id: base.id,
        title: base.title,
        description: base.description,
        date: base.date?.toIso8601String().substring(0, 10),
        images: base.images
            .map((img) => GGetWaypointsData_trip_images(image: imageToGql(img)))
            .toList(),
        waypoints: waypoints,
      ),
    ).toJson();
  }

  // ── Mutations ─────────────────────────────────────────────────────────────────

  Map<String, dynamic> createWaypoint(Map<String, dynamic> variables) {
    final tripId = variables['tripId'] as int;
    final vertexId = variables['vertexId'] as int;
    final input = GWaypointCreateInput.fromJson(
      variables['waypoint'] as Map<String, dynamic>,
    );

    final id = store.nextWaypointId.next();
    final waypoint = Waypoint(
      id: id,
      vertexId: vertexId,
      title: input.title.isPresent ? (input.title.requireValue ?? '') : '',
      type: input.type.toDomain(),
      description: input.description.isPresent
          ? (input.description.requireValue ?? '')
          : '',
    );

    store.addWaypoint(tripId, waypoint);

    return GCreateWaypointData(
      createWaypoint: waypointToGql(waypoint, store.vertex(vertexId)),
    ).toJson();
  }

  Map<String, dynamic> updateWaypoint(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final input = GWaypointUpdateInput.fromJson(
      variables['waypoint'] as Map<String, dynamic>,
    );

    final existing = store.waypoint(id);
    final updatedVertexId =
        input.vertexId.isPresent && input.vertexId.requireValue != null
        ? input.vertexId.requireValue!
        : existing.vertexId;

    final updated = existing.copyWith(
      title: input.title.isPresent && input.title.requireValue != null
          ? input.title.requireValue!
          : existing.title,
      type: input.type.isPresent && input.type.requireValue != null
          ? input.type.requireValue!.toDomain()
          : existing.type,
      description:
          input.description.isPresent && input.description.requireValue != null
          ? input.description.requireValue!
          : existing.description,
      vertexId: updatedVertexId,
    );

    store.waypointsMap[id] = updated;

    return GUpdateWaypointData(
      updateWaypoint: waypointToGql(updated, store.vertex(updatedVertexId)),
    ).toJson();
  }

  Map<String, dynamic> deleteWaypoint(int waypointId) {
    store.removeWaypoint(waypointId);
    return GDeleteWaypointData(deleteWaypoint: true).toJson();
  }

  Map<String, dynamic> attachImageToWaypoint(Map<String, dynamic> variables) {
    final waypointId = variables['waypointId'] as int;
    final fileKey = variables['fileKey'] as String;

    final waypoint = store.waypoint(waypointId);

    final image = store.getRandomPhoto(waypointId);

    if (!waypoint.images.any((img) => img.fileKey == fileKey)) {
      store.waypointsMap[waypointId] = waypoint.copyWith(
        images: [...waypoint.images, image],
      );
    }

    return GAttachImageToWaypointData(
      attachImageToWaypoint: GAttachImageToWaypointData_attachImageToWaypoint(
        image: imageToGql(image),
      ),
    ).toJson();
  }

  Map<String, dynamic> deleteImageFromWaypoint(Map<String, dynamic> variables) {
    final waypointId = variables['waypointId'] as int;
    final fileKey = variables['fileKey'] as String;

    final waypoint = store.waypoint(waypointId);

    store.waypointsMap[waypointId] = waypoint.copyWith(
      images: waypoint.images.where((img) => img.fileKey != fileKey).toList(),
    );

    return GDeleteImageFromWaypointData(
      deleteImageFromWaypoint: fileKey,
    ).toJson();
  }
}
