import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/trip.dart';
part "sketch_objects.dart";
part "user_location_objects.dart";
part "trip_object.dart";
part "segment_objects.dart";
part "vertex_objects.dart";

sealed class MapObject {
  const MapObject();
  bool get isDraggable => false;
  bool get awaitsDoubleTap => false;
  bool get isHitTestable => true;
  int get hitPriority => 0;
}

abstract interface class TopologyObject {
  SpliceAnchor get anchor;
}

abstract interface class Selectable implements MapObject {}
