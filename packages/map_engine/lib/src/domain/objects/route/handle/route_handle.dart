// route/route_handle.dart
import 'package:map_engine/src/domain/objects/map_objects.dart';

/// Poignée posée sur la polyline de la route. Factorise ce que partagent
/// toutes les poignées : on les drague, et elles passent au-dessus des
/// segments.
abstract class RouteHandle extends MapObject {
  const RouteHandle();

  @override
  bool get isDraggable => true;
}
