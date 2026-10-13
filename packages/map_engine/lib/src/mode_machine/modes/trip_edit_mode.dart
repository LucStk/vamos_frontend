import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/selection.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/command/segment_command.dart';
import 'package:map_engine/src/mode_machine/slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';
import 'package:map_engine/src/mode_machine/overlay/idle_menu_overlay.dart';
import 'package:map_engine/src/mode_machine/overlay/pencil_menu_overlay.dart';
import 'package:trip_application/trip_application.dart';

part 'trip_edit_mode/sketch_mode.dart';
part "trip_edit_mode/sketch_creation_mode.dart";
part "trip_edit_mode/sketch_edition_mode.dart";
part "trip_edit_mode/idle_editor_mode.dart";

sealed class TripEditMode extends Mode<TripEditMode> {
  const TripEditMode();
}
