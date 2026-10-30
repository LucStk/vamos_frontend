import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:trip_application/trip_application.dart';
part "sketch_objects.dart";
part "user_location_objects.dart";
part "trip_object.dart";
part "route/route_section.dart";
part "waypoint_objects.dart";
part "route/trip_origin.dart";
part "route/trip_end.dart";

sealed class MapObject {
  const MapObject();
  bool get isDraggable => false;
  bool get awaitsDoubleTap => false;
  bool get isHitTestable => true;

  /// Peut être « survolé » par un objet en cours de drag.
  /// Faux pour les proxys du pointeur (ex. Pencil).
  bool get isDropTarget => true;
  int get hitPriority => 0;
}

abstract interface class Selectable implements MapObject {}

sealed class RouteElements extends MapObject implements Selectable {
  @override
  bool get isDraggable => true;
}

extension MapHitRouteElementstoAnchor on MapHit<RouteElements> {
  RouteAnchor toRouteAnchor(MapCameraReader camera) => switch (object) {
    MapSection t => SectionAnchor(
      position: camera.worldOffsetToLatLng(point),
      sectionId: t.id,
    ),
    MapTripEnd _ => EndRouteAnchor(),
    MapTripOrigin() => StartRouteAnchor(),
  };
}
