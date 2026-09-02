import 'package:flutter_map/flutter_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_map_animations/flutter_map_animations.dart';

part 'map_controller_provider.g.dart';

@riverpod
MapController mapController(Ref ref) {
  throw UnimplementedError(
    'mapControllerProvider doit être surchargé dans ProviderScope',
  );
}

@riverpod
AnimatedMapController animatedMapController(Ref ref) {
  throw UnimplementedError(
    'animatedMapControllerProvider doit être surchargé dans ProviderScope',
  );
}

@riverpod
class PanMapController extends _$PanMapController {
  @override
  bool build() => true;
  void allow() => state = true;
  void block() => state = false;
}
