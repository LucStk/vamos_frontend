import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '../../domain/selection.dart';
import '../../domain/slot.dart';
import '/src/domain/gestures/map_gesture.dart';
import '/src/domain/objects/map_objects.dart';
import '/src/domain/space/offset_type.dart';
import '/src/mode_machine/base_mode_model.dart';
import '/src/mode_machine/gesture_result.dart';
import 'map_editor_command.dart';

import 'modes/idle/idle_menu_decorator.dart';
import 'modes/sketch/sketch_pencil_menu_decorator.dart';
part 'modes/sketch/sketch_mode.dart';
part "modes/sketch/sketch_creation_mode.dart";
part "modes/sketch/sketch_edition_mode.dart";
part "modes/idle/init/init_mode.dart";
part "modes/idle/idle_editor_mode.dart";
part 'map_editor_mode.freezed.dart';

sealed class MapEditorMode extends BaseMode<MapEditorMode> {
  const MapEditorMode();

  // void actOnSelection<S extends Selection>(
  //   GestureResult<M>? Function(S s) action,
  // ) {
  //   if (state.context.get(selection) case final S s) apply(action(s));
  // }
}
