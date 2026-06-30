import 'package:freezed_annotation/freezed_annotation.dart';
import 'overlay_state.dart';

import 'map_mode.dart';

part "map_state.freezed.dart";

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default(Idle()) MapMode mode,
    @Default(MapOverlayState.hidden()) MapOverlayState overlay,
  }) = _MapState;
}
