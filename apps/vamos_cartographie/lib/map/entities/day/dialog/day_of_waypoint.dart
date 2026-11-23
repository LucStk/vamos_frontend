import 'package:trip_application/trip_application.dart';

/// La journée d'un waypoint : celle que sa halte termine, sinon la première
/// qui le contient. Null si la route n'a pas (encore) de journée pour lui.
RouteDay? dayOfWaypoint(WaypointFields waypoint, List<RouteDay> days) {
  if (waypoint.stay != null) {
    final ending = days.where((d) => d.endsAt == waypoint.id).firstOrNull;
    if (ending != null) return ending;
  }
  const eps = 1e-6;
  final a = waypoint.anchorPosition;
  return days
      .where((d) => d.hasGeometry && a >= d.from - eps && a <= d.to + eps)
      .firstOrNull;
}
