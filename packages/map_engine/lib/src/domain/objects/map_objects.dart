import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/modes/edit_route/slots/route_selection_slot.dart';
import 'package:trip_application/trip_application.dart';
part "sketch_objects.dart";
part "user_location_objects.dart";
part "trip_object.dart";
part "waypoint_objects.dart";
part "route/mobility_span.dart";
part "route/trip_start.dart";
part "route/trip_end.dart";
part "route/mobility_badge.dart";
part "route/selection_handle.dart";
part "route/selection_highlight.dart";

sealed class MapObject {
  const MapObject();
  bool get isDraggable => false;
  bool get awaitsDoubleTap => false;
  bool get isHitTestable => true;
  bool get isMovedByDrag => isDraggable;

  /// Peut être « survolé » par un objet en cours de drag.
  /// Faux pour les proxys du pointeur (ex. Pencil).
  bool get isDropTarget => true;
  int get hitPriority => 0;
}

abstract interface class Selectable implements MapObject {}

sealed class RouteElements extends MapObject implements Selectable {
  @override
  bool get isDraggable => true;
  @override
  bool get isMovedByDrag => false;
}

extension HitObjectRouteElementstoAnchor on HitObject<RouteElements> {
  RouteAnchor toRouteAnchor(MapCameraReader camera) => switch (object) {
    MapMobilitySpan t => SectionAnchor(
      position: camera.worldOffsetToLatLng(point),
      sectionId: t.id,
    ),
    MapTripEnd _ => EndRouteAnchor(),
    MapTripStart() => StartRouteAnchor(),
  };
}
