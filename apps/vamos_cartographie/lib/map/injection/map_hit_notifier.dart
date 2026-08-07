import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_hit_notifier.g.dart';

// Providers scopés : ils lèvent une erreur si consultés hors d'un MapElementEngineWidget
@riverpod
MapController mapController(Ref ref) {
  throw UnimplementedError(
    'mapControllerProvider doit être surchargé dans ProviderScope',
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

// map_hit_notifier.dart
@riverpod
class PanMapController extends _$PanMapController {
  @override
  bool build() => true;

  void allow() => state = true;
  void block() => state = false;
}
