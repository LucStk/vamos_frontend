import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trip_application/trip_application.dart';

sealed class MapHit {
  const MapHit();
}

class SketchSegmentHit extends MapHit {
  const SketchSegmentHit();
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

// Extension super pratique pour simplifier le _onTap
extension ValueLayerHitResultX on ValueNotifier<LayerHitResult<MapHit>?> {
  MapHit get topHit {
    if (value == null || value?.hitValues == null) {
      return NoHit();
    }
    return value!.hitValues.first;
  }
}
