import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../mode_machine/mode.dart';
import '../../mode_machine/transition.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part "modes/segment_select_mode.dart";
part "modes/vertex_select_mode.dart";
part "modes/idle_view_mode.dart";
part "view_trip_mode.freezed.dart";

sealed class ViewTripMode extends Mode<ViewTripMode> {
  const ViewTripMode();
}
