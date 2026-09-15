import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/domain.dart';

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

final class MapSketchSegment extends MapLine {
  const MapSketchSegment(super.geometry);

  @override
  double get radius => 10;

  @override
  int get hitPriority => 50;

  @override
  bool isSameAs(MapObject other) => other is MapSketchSegment;
}

final class MapSketchPencil extends MapPoint {
  const MapSketchPencil(super.position);

  @override
  double get radius => 10;

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool isSameAs(MapObject other) => other is MapSketchPencil;
}

final class MapUserLocation extends MapPoint {
  final double accuracy;
  final double heading;
  const MapUserLocation(
    super.position, {
    required this.accuracy,
    required this.heading,
  });

  @override
  double get radius => 10;

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool isSameAs(MapObject other) => other is MapSketchPencil;
}
