import 'package:domain_core/domain/collection_store.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '../../domain/camera/map_camera.dart';
import "/src/domain/space/offset_type.dart";
import '../../geometry/merge_polyline.dart';
import '../../mode_machine/transition.dart';
import '../../mode_machine/mode_command.dart';
import 'map_editor_mode.dart';
part "modes/idle/segment_select_command.dart";
part "modes/idle/vertex_select_command.dart";
part "modes/idle/idle_editor_command.dart";
part "modes/sketch/sketch_command.dart";

sealed class EditorCommand<R extends Object>
    extends ModeCommand<MapEditorMode, R> {
  const EditorCommand();
}

mixin GraphReader {
  GraphEditor get graphEditor;
  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
}
