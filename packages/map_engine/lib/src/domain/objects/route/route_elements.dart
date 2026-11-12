import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/objects.dart';
import 'package:trip_application/trip_application.dart';

abstract class RouteElements extends MapObject implements Selectable {
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
    _ => throw UnimplementedError(
      'Unsupported route element: ${object.runtimeType}',
    ),
  };
}
