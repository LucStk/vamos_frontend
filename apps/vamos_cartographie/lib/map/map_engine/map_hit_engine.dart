import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/map/map_engine/map_engine.dart';

class MapHitEngine {
  final polylineHitNotifier = ValueNotifier<LayerHitResult<MapHit>?>(null);

  MapHit get topHit {
    final value = polylineHitNotifier.value;
    if (value == null) {
      return NoHit();
    }
    return value.hitValues.first;
  }
}
