import 'dart:math';
import 'dart:ui';

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

/// Longueur de route prise de chaque côté de l'ancre pour en lisser la
/// direction : les à-coups d'un tracé ne font pas tourner l'épingle.
const _windowMeters = 150.0;

const _distance = Distance(roundResult: false);

double _meters(MapCameraReader camera, WorldOffset a, WorldOffset b) =>
    _distance(camera.worldOffsetToLatLng(a), camera.worldOffsetToLatLng(b));

/// Le point de la route à [meters] de [from] (position continue sur la
/// polyligne), en avant ([forward]) ou en arrière ; l'extrémité si la route
/// est plus courte.
WorldOffset _alongRoute(
  RoutePolyline line,
  MapCameraReader camera,
  double from,
  double meters, {
  required bool forward,
}) {
  var position = from;
  var previous = line.pointAt(from);
  var walked = 0.0;
  while (true) {
    final next = forward ? position.floor() + 1 : position.ceil() - 1;
    if (next < 0 || next > line.maxPosition) return previous;
    final vertex = line.points[next];
    final length = _meters(camera, previous, vertex);
    if (walked + length >= meters && length > 0) {
      final t = (meters - walked) / length;
      return WorldOffset(Offset.lerp(previous.value, vertex.value, t)!);
    }
    walked += length;
    previous = vertex;
    position = next.toDouble();
  }
}

/// Direction de la pointe vers la tête : perpendiculaire à la route moyenne
/// autour de l'ancre du waypoint (le segment qui relie la route [_windowMeters]
/// avant et après elle), du côté où le waypoint se trouve. La pointe regarde
/// donc la route et la tête s'en écarte. Droit vers le haut sans route, ou
/// quand le waypoint est sur elle.
double _pinDirection(
  RoutePolyline? polyline,
  WorldOffset position,
  double anchorPosition,
  MapCameraReader camera,
) {
  if (polyline == null) return WaypointItem.upright;
  final before = _alongRoute(
    polyline,
    camera,
    anchorPosition,
    _windowMeters,
    forward: false,
  );
  final after = _alongRoute(
    polyline,
    camera,
    anchorPosition,
    _windowMeters,
    forward: true,
  );
  final chord = after.value - before.value;
  if (chord.distance == 0) return WaypointItem.upright;

  // Les deux perpendiculaires à la route ; on garde celle du côté du waypoint.
  var normal = Offset(-chord.dy, chord.dx);
  final onRoute = polyline.pointAt(anchorPosition);
  final side = position.value - onRoute.value;
  final dot = normal.dx * side.dx + normal.dy * side.dy;
  final isOnRoute = _meters(camera, position, onRoute) < _onRouteMeters;
  // Sur la route : du côté du haut de l'écran (y vers le bas).
  final flip = isOnRoute ? normal.dy > 0 : dot < 0;
  if (flip) normal = -normal;
  return atan2(normal.dy, normal.dx);
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
    direction: _pinDirection(
      polyline,
      position,
      d.anchorPosition,
      cameraReader,
    ),
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
