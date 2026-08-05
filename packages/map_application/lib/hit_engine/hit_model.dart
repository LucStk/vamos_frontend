import 'package:trip_application/trip_application.dart';

sealed class MapElement {
  const MapElement();
}

class MapSketchSegment extends MapElement {
  const MapSketchSegment();
}

class MapSketchPencil extends MapElement {
  const MapSketchPencil();
}

class MapCursor extends MapElement {
  const MapCursor();
}

class MapVertex extends MapElement {
  final VertexFields vertex;
  const MapVertex(this.vertex);
}

class NoMapElement extends MapElement {
  const NoMapElement();
}

class MapSegment extends MapElement {
  final SegmentId segmentId;
  const MapSegment(this.segmentId);
}

/// Deux hits désignent-ils le même objet métier ?
/// Utilisé pour exclure l'objet en cours de manipulation
/// de sa propre détection de hit.
bool isSameHitTarget(MapElement a, MapElement b) => switch ((a, b)) {
  (MapVertex(vertex: final va), MapVertex(vertex: final vb)) => va.id == vb.id,
  (MapCursor(), MapCursor()) => true,
  (MapSegment(segmentId: final sa), MapSegment(segmentId: final sb)) =>
    sa == sb,
  _ => false,
};
