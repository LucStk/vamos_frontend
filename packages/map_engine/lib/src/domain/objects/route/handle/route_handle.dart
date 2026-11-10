// route/route_handle.dart
part of '../../map_objects.dart';

/// Poignée posée sur la polyline de la route. Factorise ce que partagent
/// toutes les poignées : on les drague, et elles passent au-dessus des
/// segments.
sealed class RouteHandle extends MapObject {
  const RouteHandle();

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 10; // reprends la valeur actuelle de SelectionHandle
}
