// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/selection.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/command/segment_command.dart';
import 'package:map_engine/src/mode_machine/app_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class PencilMenu extends MapObjectMenu<MapSketchPencil> {
  PencilMenu(super.p);
  @override
  MenuAnchor get anchor => PencilAnchor(object);

  Transition<AppMode> valideCreation() =>
      Transition.withSlot(sketchTraceSlot, (trace) {
        return Transition.run(
          CreateSegmentFromSketch(
            geometry: trace.points,
            mobilityType: trace.mobilityType,
          ),

          then: (current, segment) {
            final editor = current.modeAs<SketchMode>();
            if (editor == null) return null;
            return Transition.to(TripEditMode(editor.tripId)).and(
              selectionSlot,
              MapSegment(tripId: editor.tripId, id: segment.id),
            );
          },
        );
      });
}
