import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_application/hit_engine/hit_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_hit_notifier.g.dart';

// Providers scopés : ils lèvent une erreur si consultés hors d'un MapHitEngineWidget
@riverpod
MapController mapController(Ref ref) {
  throw UnimplementedError(
    'mapControllerProvider doit être surchargé dans ProviderScope',
  );
}

// map_hit_notifier.dart
@riverpod
ValueNotifier<LayerHitResult<MapHit>?> vertexHitLayer(Ref ref) {
  throw UnimplementedError('vertexHitLayerProvider doit être surchargé');
}

@riverpod
ValueNotifier<LayerHitResult<MapHit>?> cursorHitLayer(Ref ref) {
  throw UnimplementedError('cursorHitLayerProvider doit être surchargé');
}

@riverpod
ValueNotifier<LayerHitResult<MapHit>?> segmentHitLayer(Ref ref) {
  throw UnimplementedError('segmentHitLayerProvider doit être surchargé');
}

@riverpod
ValueNotifier<LayerHitResult<MapHit>?> sketchHitLayer(Ref ref) {
  throw UnimplementedError('sketchHitLayerProvider doit être surchargé');
}

// map_hit_notifier.dart
@riverpod
ValueNotifier<bool> shouldPanMap(Ref ref) {
  throw UnimplementedError(
    'shouldPanMapProvider doit être surchargé dans ProviderScope',
  );
}
