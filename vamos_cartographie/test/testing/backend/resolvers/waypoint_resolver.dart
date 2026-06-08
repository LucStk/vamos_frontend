import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../fake_graphql_store.dart';
import 'gql_mappers.dart';

/// Résout les opérations GraphQL relatives aux waypoints.
class WaypointResolver {
  final FakeGraphQLStore store;

  WaypointResolver(this.store);

  // ── Queries ──────────────────────────────────────────────────────────────────

  Map<String, dynamic> getWaypoints(int tripId) {
    final base = store.trips[tripId];
    if (base == null) throw Exception('Trip introuvable : id=$tripId');

    final waypointIds = store.tripWaypointIds[tripId] ?? [];
    final waypoints = waypointIds.map((wId) {
      final w = store.waypoints[wId]!;
      return waypointToGql(w, store.vertices[w.vertexId]!);
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

    if (!store.trips.containsKey(tripId))
      throw Exception('Trip introuvable : id=$tripId');
    if (!store.vertices.containsKey(vertexId))
      throw Exception('Vertex introuvable : id=$vertexId');

    final id = store.allocateWaypointId();
    final waypoint = Waypoint(
      id: id,
      vertexId: vertexId,
      title: input.title.isPresent ? (input.title.requireValue ?? '') : '',
      type: input.type.toDomain(),
      description: input.description.isPresent
          ? (input.description.requireValue ?? '')
          : '',
    );

    store.waypoints[id] = waypoint;
    (store.tripWaypointIds[tripId] ??= []).add(id);

    return GCreateWaypointData(
      createWaypoint: waypointToGql(waypoint, store.vertices[vertexId]!),
    ).toJson();
  }

  Map<String, dynamic> updateWaypoint(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final input = GWaypointUpdateInput.fromJson(
      variables['waypoint'] as Map<String, dynamic>,
    );

    final existing = store.waypoints[id];
    if (existing == null) throw Exception('Waypoint introuvable : id=$id');

    final updatedVertexId =
        input.vertexId.isPresent && input.vertexId.requireValue != null
        ? input.vertexId.requireValue!
        : existing.vertexId;

    if (!store.vertices.containsKey(updatedVertexId))
      throw Exception('Vertex introuvable : id=$updatedVertexId');

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

    store.waypoints[id] = updated;

    return GUpdateWaypointData(
      updateWaypoint: waypointToGql(updated, store.vertices[updatedVertexId]!),
    ).toJson();
  }

  Map<String, dynamic> deleteWaypoint(int waypointId) {
    if (!store.waypoints.containsKey(waypointId))
      throw Exception('Waypoint introuvable : id=$waypointId');

    store.waypoints.remove(waypointId);
    final tripId = store.tripIdForWaypoint(waypointId);
    store.tripWaypointIds[tripId]?.remove(waypointId);

    return GDeleteWaypointData(deleteWaypoint: true).toJson();
  }

  Map<String, dynamic> attachImageToWaypoint(Map<String, dynamic> variables) {
    final waypointId = variables['waypointId'] as int;
    final fileKey = variables['fileKey'] as String;

    final waypoint = store.waypoints[waypointId];
    if (waypoint == null)
      throw Exception('Waypoint introuvable : id=$waypointId');

    final image = store.carouselItems[fileKey]?.remoteImage;
    if (image == null)
      throw Exception('Image introuvable dans le store : $fileKey');

    if (!waypoint.images.any((img) => img.fileKey == fileKey)) {
      store.waypoints[waypointId] = waypoint.copyWith(
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

    final waypoint = store.waypoints[waypointId];
    if (waypoint == null)
      throw Exception('Waypoint introuvable : id=$waypointId');

    store.waypoints[waypointId] = waypoint.copyWith(
      images: waypoint.images.where((img) => img.fileKey != fileKey).toList(),
    );

    return GDeleteImageFromWaypointData(
      deleteImageFromWaypoint: fileKey,
    ).toJson();
  }
}
