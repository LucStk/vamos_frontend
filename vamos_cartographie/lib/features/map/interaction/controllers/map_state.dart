import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vamos_cartographie/features/map/interaction/overlay/overlay_state.dart';

import '../machine/map_mode.dart';

part "map_state.freezed.dart";

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    required MapMode mode,
    required MapOverlayState overlay,
    @Default(false) bool cursorOpen,
  }) = _MapState;
}
