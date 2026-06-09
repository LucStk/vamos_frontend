import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/dev_backend/mapping/gql_mappers.dart";

/// Résout les opérations GraphQL relatives aux waypoints.
class WaypointResolver {
  final FakeGraphQLStore store;

  /// Table de correspondance qui associe chaque nom d'opération GraphQL
  /// à sa fonction de traitement (désérialisation -> exécution -> JSON).
  late final Map<String, Map<String, dynamic>? Function(Map<String, dynamic>?)>
  mockHandlers;

  WaypointResolver(this.store) {
    _initHandlers();
  }

  void _initHandlers() {
    mockHandlers = {
      // Queries
      "GetWaypoints": (raw) =>
          getWaypoints(GGetWaypointsVars.fromJson(raw ?? const {})).toJson(),

      // Mutations
      "CreateWaypoint": (raw) => createWaypoint(
        GCreateWaypointVars.fromJson(raw ?? const {}),
      ).toJson(),
      "UpdateWaypoint": (raw) => updateWaypoint(
        GUpdateWaypointVars.fromJson(raw ?? const {}),
      ).toJson(),
      "DeleteWaypoint": (raw) => deleteWaypoint(
        GDeleteWaypointVars.fromJson(raw ?? const {}),
      ).toJson(),
      "AttachImageToWaypoint": (raw) => attachImageToWaypoint(
        GAttachImageToWaypointVars.fromJson(raw ?? const {}),
      ).toJson(),
      "DeleteImageFromWaypoint": (raw) => deleteImageFromWaypoint(
        GDeleteImageFromWaypointVars.fromJson(raw ?? const {}),
      ).toJson(),
    };
  }

  // ── Queries ──────────────────────────────────────────────────────────────────

  GGetWaypointsData getWaypoints(GGetWaypointsVars vars) {
    final base = store.trip(vars.tripId);
    final waypoints = store.waypoints(vars.tripId).map((w) {
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
    );
  }

  // ── Mutations ─────────────────────────────────────────────────────────────────

  GCreateWaypointData createWaypoint(GCreateWaypointVars vars) {
    final tripId = vars.tripId;
    final vertexId = vars.vertexId;
    final input = GWaypointCreateInput.fromJson(
      vars.waypoint as Map<String, dynamic>,
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
    );
  }

  GUpdateWaypointData updateWaypoint(GUpdateWaypointVars vars) {
    final int id = vars.id;
    final GWaypointUpdateInput input = vars.waypoint;

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
    );
  }

  GDeleteWaypointData deleteWaypoint(GDeleteWaypointVars vars) {
    store.removeWaypoint(vars.waypointId);
    return GDeleteWaypointData(deleteWaypoint: true);
  }

  GAttachImageToWaypointData attachImageToWaypoint(
    GAttachImageToWaypointVars vars,
  ) {
    final int waypointId = vars.waypointId;
    final String fileKey = vars.fileKey;

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
    );
  }

  GDeleteImageFromWaypointData deleteImageFromWaypoint(
    GDeleteImageFromWaypointVars vars,
  ) {
    final int waypointId = vars.waypointId;
    final String fileKey = vars.fileKey;

    final waypoint = store.waypoint(waypointId);

    store.waypointsMap[waypointId] = waypoint.copyWith(
      images: waypoint.images.where((img) => img.fileKey != fileKey).toList(),
    );

    return GDeleteImageFromWaypointData(deleteImageFromWaypoint: fileKey);
  }
}
