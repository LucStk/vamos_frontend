import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

sealed class MapElement {
  const MapElement();
  bool get isDraggable => false;
  bool get awaitsDoubleTap => false;
}

class MapSketchSegment extends MapElement {
  const MapSketchSegment();
}

class MapSketchPencil extends MapElement {
  final LatLng latLng;
  const MapSketchPencil(this.latLng);
  @override
  bool get isDraggable => true;
}

class MapCursor extends MapElement {
  final LatLng latLng;
  const MapCursor(this.latLng);
  @override
  bool get isDraggable => true;
}

class NoMapElement extends MapElement {
  const NoMapElement();
  @override
  bool get awaitsDoubleTap => true;
}

class MapSpace extends MapElement {
  const MapSpace();
}

class MapVertex extends MapElement {
  final VertexFields vertex;
  const MapVertex(this.vertex);
  @override
  bool get isDraggable => true;
}

class MapSegment extends MapElement {
  final SegmentId segmentId;
  const MapSegment(this.segmentId);
}

/// Deux hits désignent-ils le même objet métier ?
/// Utilisé pour exclure l'objet en cours de manipulation
/// de sa propre détection de hit.
bool isSameHitTarget(MapElement a, MapElement b) => switch ((a, b)) {
  (NoMapElement(), NoMapElement()) => true,
  (MapVertex(vertex: final va), MapVertex(vertex: final vb)) => va.id == vb.id,
  (MapCursor(), MapCursor()) => true,
  (MapSketchPencil _, MapSketchPencil _) => true,
  (MapSketchSegment _, MapSketchSegment _) => true,
  (MapSegment(segmentId: final sa), MapSegment(segmentId: final sb)) =>
    sa == sb,
  _ => false,
};
