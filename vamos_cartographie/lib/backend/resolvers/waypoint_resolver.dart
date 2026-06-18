import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';

import "package:vamos_cartographie/backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/backend/mapping/gql_mappers.dart";
import "package:gql_tristate_value/gql_tristate_value.dart";

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
    final base = store.trip(Id<Trip>(vars.tripId));
    final waypoints = store.waypoints(Id<Trip>(vars.tripId)).map((w) {
      return waypointToGql(w, store.vertex(w.vertexId));
    }).toList();

    return GGetWaypointsData(
      trip: GGetWaypointsData_trip(
        id: base.id.value,
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
    final tripId = Id<Trip>(vars.tripId);
    final input = vars.waypoint;
    late Id<Vertex> vertexId;
    switch (input.vertexId) {
      case PresentValue(value: final id):
        vertexId = Id<Vertex>(id!);
        break;
      case AbsentValue():
        final latLng = input.latLng.valueOrNull;
        if (latLng == null) {
          throw Exception("CreateWaypoint Fail : pas de vertexId et de latLng");
        }
        // Création d'un nouveau vertex à l'endroit approprié
        vertexId = Id<Vertex>(store.nextVertexId.next());
        store.addVertex(
          tripId,
          Vertex(id: vertexId, latLng: LatLng(latLng.lat, latLng.lng)),
        );
    }

    final id = store.nextWaypointId.next();
    final waypoint = Waypoint(
      id: Id<Waypoint>(id),
      vertexId: vertexId,
      title: input.title.isPresent ? (input.title.requireValue ?? '') : '',
      poiCategory: input.poiCategory.toDomain(),
      description: input.description.isPresent
          ? (input.description.requireValue ?? '')
          : '',
    );

    store.addWaypoint(tripId, waypoint);
    // À la fin de createWaypoint, juste avant le return :
    return GCreateWaypointData(
      createWaypoint: waypointCreateToGql(
        waypoint,
        store.vertex(waypoint.vertexId),
      ),
    );
  }

  GUpdateWaypointData updateWaypoint(GUpdateWaypointVars vars) {
    final id = Id<Waypoint>(vars.id);
    final GWaypointUpdateInput input = vars.waypoint;

    final existing = store.waypoint(id);
    final updatedVertexId =
        input.vertexId.isPresent && input.vertexId.requireValue != null
        ? Id<Vertex>(input.vertexId.requireValue!)
        : existing.vertexId;

    final updated = existing.copyWith(
      title: input.title.isPresent && input.title.requireValue != null
          ? input.title.requireValue!
          : existing.title,
      poiCategory:
          input.poiCategory.isPresent && input.poiCategory.requireValue != null
          ? input.poiCategory.requireValue!.toDomain()
          : existing.poiCategory,
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
    store.removeWaypoint(Id<Waypoint>(vars.waypointId));
    return GDeleteWaypointData(deleteWaypoint: true);
  }

  GAttachImageToWaypointData attachImageToWaypoint(
    GAttachImageToWaypointVars vars,
  ) {
    final Id<Waypoint> waypointId = Id<Waypoint>(vars.waypointId);
    final String fileKey = vars.fileKey;

    final waypoint = store.waypoint(waypointId);
    final image = store.getMediaImage(fileKey);

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
    final Id<Waypoint> waypointId = Id<Waypoint>(vars.waypointId);
    final String fileKey = vars.fileKey;

    final waypoint = store.waypoint(waypointId);

    store.waypointsMap[waypointId] = waypoint.copyWith(
      images: waypoint.images.where((img) => img.fileKey != fileKey).toList(),
    );

    return GDeleteImageFromWaypointData(deleteImageFromWaypoint: fileKey);
  }
}
