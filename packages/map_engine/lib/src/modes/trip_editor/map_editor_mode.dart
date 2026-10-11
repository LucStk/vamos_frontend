import 'package:trip_application/trip_application.dart';

import '../../domain/selection.dart';
import '../../domain/sketch_trace.dart';
import '../../mode_machine/slot.dart';
import '/src/domain/gestures/map_gesture.dart';
import '/src/domain/objects/map_objects.dart';
import '/src/mode_machine/mode.dart';
import '/src/mode_machine/transition.dart';
import 'map_editor_command.dart';

import 'modes/idle/idle_menu_overlay.dart';
import 'modes/sketch/sketch_pencil_menu_overlay.dart';
part 'modes/sketch/sketch_mode.dart';
part "modes/sketch/sketch_creation_mode.dart";
part "modes/sketch/sketch_edition_mode.dart";
part "modes/idle/init_mode.dart";
part "modes/idle/idle_editor_mode.dart";

sealed class MapEditorMode extends Mode<MapEditorMode> {
  const MapEditorMode();
}
