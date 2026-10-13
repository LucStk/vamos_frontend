// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/selection.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/command/segment_command.dart';
import 'package:map_engine/src/mode_machine/modes/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu_overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class PencilMenu extends ContextMenuOverlay<TripEditMode> {
  const PencilMenu(super.at);
  Transition<TripEditMode> valideCreation() =>
      Transition.withSlot(sketchTraceSlot, (trace) {
        return Transition.run(
          CreateSegmentFromSketch(
            geometry: trace.points,
            mobilityType: trace.mobilityType,
          ),
          then: (current, segment) => Transition.to(
            IdleEditor(),
          ).and(selectionSlot, MapSegment(segment.id)),
        );
      });
}
