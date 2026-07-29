import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map_engine/map_engine.dart';

part 'map_hit_notifier.g.dart';

// Providers scopés : ils lèvent une erreur si consultés hors d'un MapHitEngineWidget
@riverpod
MapController mapController(Ref ref) {
  throw UnimplementedError(
    'mapControllerProvider doit être surchargé dans ProviderScope',
  );
}

@riverpod
ValueNotifier<LayerHitResult<MapHit>?> hitLayerNotifier(Ref ref) {
  throw UnimplementedError(
    'hitNotifierProvider doit être surchargé dans ProviderScope',
  );
}
