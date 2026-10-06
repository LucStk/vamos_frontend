import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_mode.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
class MapMode extends _$MapMode {
  @override
  BaseMode build() {
    throw StateError('mapMode doit être fourni par un MapScope');
  }

  void set(BaseMode mode) {
    state = mode;
  }
}
