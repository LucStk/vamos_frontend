import 'package:trip_application/trip_application.dart';

sealed class MapHit {
  const MapHit();
}

class SketchSegmentHit extends MapHit {
  const SketchSegmentHit();
}

class SketchPencilHit extends MapHit {
  final VertexId? vertexTouched;
  const SketchPencilHit(this.vertexTouched);
}

class CursorHit extends MapHit {
  const CursorHit();
}

class VertexHit extends MapHit {
  final VertexFields vertex;
  const VertexHit(this.vertex);
}

class NoHit extends MapHit {
  const NoHit();
}

class SegmentHit extends MapHit {
  final SegmentId segmentId;
  const SegmentHit(this.segmentId);
}
