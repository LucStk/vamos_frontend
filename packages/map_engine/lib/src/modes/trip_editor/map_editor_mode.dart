import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '/src/domain/gestures/map_gesture.dart';
import '/src/domain/objects/map_objects.dart';
import '/src/domain/space/offset_type.dart';
import '/src/mode_machine/base_mode_model.dart';
import '/src/mode_machine/gesture_result.dart';
import 'map_editor_command.dart';
import 'modes/idle/idle/idle_menu.dart';

part 'modes/sketch/sketch_mode.dart';
part "modes/sketch/sketch_creation_mode.dart";
part "modes/sketch/sketch_edition_mode.dart";
part "modes/idle/init/init_mode.dart";
part "modes/idle/idle/idle_editor_mode.dart";
part "modes/idle/vertex_select/vertex_select_mode.dart";
part "modes/idle/segment_select/segment_select_mode.dart";
part 'map_editor_mode.freezed.dart';

sealed class MapEditorMode extends BaseMode<MapEditorMode> {
  const MapEditorMode();
}
