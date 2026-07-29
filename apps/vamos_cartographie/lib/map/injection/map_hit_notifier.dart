import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map_engine/map_hit_engine.dart';

part 'map_hit_notifier.g.dart';

@riverpod
MapHitEngine mapHitEngine(Ref ref) {
  return MapHitEngine();
}
