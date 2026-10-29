import 'package:latlong2/latlong.dart';
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
  int get hitPriority => 0;
}

abstract interface class Selectable implements MapObject {}

sealed class RouteElements extends MapObject implements Selectable {}

extension ToRouteAnchor on RouteElements {
  RouteAnchor toRouteAnchor(LatLng position) => switch (this) {
    MapSection t => SectionAnchor(position: position, sectionId: t.id),
    MapTripEnd _ => EndRouteAnchor(),
    MapTripOrigin() => StartRouteAnchor(),
  };
}
