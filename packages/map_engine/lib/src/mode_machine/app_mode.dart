import 'package:map_engine/src/mode_machine/command/camera_command.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:map_engine/src/mode_machine/command/trip_command.dart';
import 'package:map_engine/src/mode_machine/mode.dart';

import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/overlay.dart';
import 'package:map_engine/src/mode_machine/overlay/map_point_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/pencil_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/vertex_menu.dart';
import 'package:map_engine/src/mode_machine/slots/selection_slot.dart';
import 'package:map_engine/src/mode_machine/slots/sketch_trace_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/slots/trip_origin_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:map_engine/src/mode_machine/mode_state.dart';
import 'package:trip_application/trip_application.dart';

part 'modes/sketch_mode/sketch_mode.dart';
part "modes/sketch_mode/sketch_creation_mode.dart";
part "modes/sketch_mode/sketch_edition_mode.dart";
part "modes/trip_mode.dart";
part "modes/trip_edit_mode.dart";
part "modes/explore_mode.dart";

typedef AppTransition = Transition<AppMode>;
typedef AppModeState = ModeState<AppMode>;
typedef AppOverlay =
    Overlay<
      AppMode
    >; // évite aussi le conflit avec le widget Overlay de Flutter

sealed class AppMode extends Mode<AppMode> {
  const AppMode();
}
