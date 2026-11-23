import 'dart:math';

import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/objects/waypoint/waypoint_item.dart';

part 'waypoint_item_provider.g.dart';

/// En deçà, le waypoint est sur la route : pas de côté d'où elle serait.
const _onRouteMeters = 3.0;

/// Direction de la pointe vers la tête : la pointe regarde le point de la route
/// le plus proche de [position] (sa tangente, comme l'ancre du waypoint, n'y
/// sont pour rien), la tête s'en écarte. Droit vers le haut sans route, ou
/// quand le waypoint est sur elle.
double _pinDirection(
  RoutePolyline? polyline,
  WorldOffset position,
  MapCameraReader camera,
) {
  if (polyline == null) return WaypointItem.upright;
  final nearest = polyline.pointAt(polyline.project(position));
  final away = position.value - nearest.value;
  final meters = const Distance()(
    camera.worldOffsetToLatLng(position),
    camera.worldOffsetToLatLng(nearest),
  );
  if (meters < _onRouteMeters || away.distance == 0) {
    return WaypointItem.upright;
  }
  return atan2(away.dy, away.dx);
}

@Riverpod(keepAlive: true)
WaypointItem waypointItem(
  Ref ref,
  TripId tripId,
  WaypointId id,
  MapCameraReader cameraReader,
) {
  final d = ref.watch(waypointProvider(tripId, id));
  final position = cameraReader.latLngToWorldOffset(d.position);
  final polyline = ref.watch(routePolylineProvider(tripId, cameraReader));
  return WaypointItem(
    worldPosition: position,
    object: MapWaypoint(tripId: tripId, id: id),
    kindStyle: d.display,
    direction: _pinDirection(polyline, position, cameraReader),
  );
}

@Riverpod(keepAlive: true)
List<PointItem> allWaypointItem(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  return [
    for (final id in ref.watch(allWaypointIdsProvider(tripId)))
      ref.watch(waypointItemProvider(tripId, id, camera)),
  ];
}

/// Les waypoints au second plan : sous la route, presque transparents. Pour
/// les scènes où ils ne servent que de repère ; [except] reste à part.
///
/// Fonction simple (pas de génération) : sans `build_runner`.
List<PointItem> backgroundWaypointItems(
  Ref ref,
  TripId tripId,
  MapCameraReader camera, {
  WaypointId? except,
}) {
  return [
    for (final id in ref.watch(allWaypointIdsProvider(tripId)))
      if (id != except)
        ref.watch(waypointItemProvider(tripId, id, camera)).asBackground(),
  ];
}
