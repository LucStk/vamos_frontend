import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

sealed class MapHit {
  const MapHit();
}

class SketchSegmentHit extends MapHit {
  const SketchSegmentHit();
}

class CursorHit extends MapHit {
  const CursorHit();
}

class VertexHit extends MapHit {
  final VertexId vertexId;
  const VertexHit(this.vertexId);
}

class NoHit extends MapHit {
  const NoHit();
}

class SegmentHit extends MapHit {
  final SegmentId segmentId;
  const SegmentHit(this.segmentId);
}
