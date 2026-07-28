import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:trip_application/trip_application.dart';

sealed class NotifierHit {
  const NotifierHit();
}

class SketchSegmentHit extends NotifierHit {
  const SketchSegmentHit();
}

class NoHit extends NotifierHit {
  const NoHit();
}

class SegmentHit extends NotifierHit {
  final SegmentId segmentId;
  const SegmentHit(this.segmentId);
}

// Extension super pratique pour simplifier le _onTap
extension ValueLayerHitResultX on ValueNotifier<LayerHitResult<NotifierHit>?> {
  NotifierHit get topHit {
    if (value == null || value?.hitValues == null) {
      return NoHit();
    }
    return value!.hitValues.first;
  }
}
