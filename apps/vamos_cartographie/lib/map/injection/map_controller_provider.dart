import 'package:domain_core/domain_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/editor.dart';
import 'package:map_application/hit_engine/map_hit_tester.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:trip_application/trip/domain/trip.dart';

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
