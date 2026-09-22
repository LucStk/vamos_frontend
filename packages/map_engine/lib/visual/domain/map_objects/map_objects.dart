import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'package:trip_application/trip/trip.dart';
part "sketch_objects.dart";
part "user_location_objects.dart";
part "trip_object.dart";

sealed class MapObject {
  const MapObject();

  bool get isDraggable => false;
  bool get awaitsDoubleTap => false;
  bool get isHitTestable => true;
  double get radius;

  int get hitPriority => 0;

  bool isSameAs(MapObject other);
}

abstract interface class TopologyObject {
  SpliceAnchor get anchor;
}

sealed class MapPoint extends MapObject {
  final LatLng position;
  const MapPoint(this.position);
}

sealed class MapLine extends MapObject {
  final List<LatLng> geometry;
  const MapLine(this.geometry);
}

final class MapVertex extends MapPoint implements TopologyObject {
  final VertexId id;
  const MapVertex(this.id, super.position);

  @override
  SpliceAnchor get anchor => VertexAnchor(id);

  @override
  double get radius => 24;

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 100;

  @override
  bool isSameAs(MapObject other) => other is MapVertex && other.id == id;
}

final class MapSegment extends MapLine implements TopologyObject {
  final SegmentId id;
  const MapSegment(this.id, super.geometry);

  @override
  SpliceAnchor get anchor => SegmentAnchor(id);

  @override
  double get radius => 10;

  @override
  int get hitPriority => 50;

  @override
  bool isSameAs(MapObject other) => other is MapSegment && other.id == id;
}
