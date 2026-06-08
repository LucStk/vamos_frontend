import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

// ── Vertex ────────────────────────────────────────────────────────────────────

Vertex vertex({int id = 1, double lat = 48.8566, double lng = 2.3522}) =>
    Vertex(id: id, latLng: LatLng(lat, lng));

/// Paire de vertices consécutifs pour un segment.
({Vertex start, Vertex end}) vertexPair({
  int startId = 1,
  int endId = 2,
  double startLat = 48.8566,
  double startLng = 2.3522,
  double endLat = 48.8600,
  double endLng = 2.3600,
}) => (
  start: vertex(id: startId, lat: startLat, lng: startLng),
  end: vertex(id: endId, lat: endLat, lng: endLng),
);

// ── Segment ───────────────────────────────────────────────────────────────────

Segment segment({
  int id = 1,
  int startVertexId = 1,
  int endVertexId = 2,
  SegmentType type = SegmentType.bike,
  List<LatLng> geometry = const [],
}) => Segment(
  id: id,
  startVertexId: startVertexId,
  endVertexId: endVertexId,
  type: type,
  geometry: geometry,
);

SegmentDraft segmentDraft({
  int startVertexId = 1,
  int endVertexId = 2,
  SegmentType type = SegmentType.bike,
}) => SegmentDraft(
  startVertexId: startVertexId,
  endVertexId: endVertexId,
  type: type,
);
