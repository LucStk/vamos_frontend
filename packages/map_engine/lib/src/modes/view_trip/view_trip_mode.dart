import '../../../map_engine.dart';
import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../mode_machine/base_mode_model.dart';
import '../../mode_machine/gesture_result.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part "modes/segment_select_mode.dart";
part "modes/vertex_select_mode.dart";
part "modes/idle_view_mode.dart";
part "view_trip_mode.freezed.dart";

sealed class ViewTripMode extends BaseMode<ViewTripMode> {
  const ViewTripMode();
}
