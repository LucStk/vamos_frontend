import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/overlay_state.dart';

import 'map_mode.dart';

part "map_state.freezed.dart";

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    required MapMode mode,
    required MapOverlayState overlay,
  }) = _MapState;
}
