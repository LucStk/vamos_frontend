import 'package:domain_core/domain/collection_store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '../../domain/gestures/map_gesture.dart';
import '../../domain/objects/map_objects.dart';
import '../../domain/space/offset_type.dart';
import '../../geometry/merge_polyline.dart';
import '../../mode_machine/base_mode_model.dart';
import '../../mode_machine/gesture_result.dart';
import '../../mode_machine/mode_command.dart';
part 'modes/sketch/sketch_mode.dart';
part "modes/sketch/sketch_creation_mode.dart";
part "modes/sketch/sketch_edition_mode.dart";
part "modes/idle/init/init_mode.dart";
part "modes/idle/idle_editor_mode.dart";
part "modes/idle/vertex_select/vertex_select_mode.dart";
part "modes/idle/segment_select/segment_select_mode.dart";
part 'map_editor_mode.freezed.dart';

sealed class EditorCommand<R extends Object>
    extends ModeCommand<MapEditorMode, R> {
  const EditorCommand();
}

sealed class MapEditorMode extends BaseMode<MapEditorMode> {
  const MapEditorMode();
}

mixin GraphReader {
  GraphEditor get graphEditor;
  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
}

/// Exécute un effet sans donnée de retour.
Future<Done> _done(Future<void> Function() effect) async {
  await effect();
  return const Done();
}
