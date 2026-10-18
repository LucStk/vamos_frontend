import 'package:trip_application/trip_application.dart';
part "sketch_objects.dart";
part "user_location_objects.dart";
part "trip_object.dart";
part "segment_objects.dart";
part "waypoint_objects.dart";

sealed class MapObject {
  const MapObject();
  bool get isDraggable => false;
  bool get awaitsDoubleTap => false;
  bool get isHitTestable => true;
  int get hitPriority => 0;
}

abstract interface class Selectable implements MapObject {}
