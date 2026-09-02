import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_map_animations/flutter_map_animations.dart';

part 'map_hit_notifier.g.dart';

@riverpod
MapController mapController(Ref ref) {
  throw UnimplementedError(
    'mapControllerProvider doit être surchargé dans ProviderScope',
  );
}

// Nouveau — expose le wrapper animé, distinct du MapController brut
@riverpod
AnimatedMapController animatedMapController(Ref ref) {
  throw UnimplementedError(
    'animatedMapControllerProvider doit être surchargé dans ProviderScope',
  );
}

@riverpod
ValueNotifier<LayerHitResult<MapElement>?> segmentHitLayer(Ref ref) {
  throw UnimplementedError('segmentHitLayerProvider doit être surchargé');
}

@riverpod
ValueNotifier<LayerHitResult<MapElement>?> sketchHitLayer(Ref ref) {
  throw UnimplementedError('sketchHitLayerProvider doit être surchargé');
}

@riverpod
class PanMapController extends _$PanMapController {
  @override
  bool build() => true;
  void allow() => state = true;
  void block() => state = false;
}
