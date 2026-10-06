import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../domain/space/offset_type.dart';
import '../../mode_machine/base_mode_model.dart';
import '../../mode_machine/gesture_result.dart';

part 'map_explore_mode.freezed.dart';
part 'modes/idle_explorer_mode.dart';
part 'modes/trip_select_mode.dart';

sealed class MapExploreMode extends BaseMode<MapExploreMode> {
  const MapExploreMode();
}
