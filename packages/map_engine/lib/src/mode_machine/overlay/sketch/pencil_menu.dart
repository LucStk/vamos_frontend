// segment_select_mode.dart (ou son dossier)
import 'package:map_engine/src/domain/map_anchor.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';

import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class PencilMenu extends MapObjectMenu<PencilMapAnchor> {
  PencilMenu(super.anchor);

  Transition<AppMode> valideCreation() => Transition.stay();
  //       Transition.withSlot(sketchTraceSlot, (trace) {
  //         return Transition.run(
  //           CreateSegmentFromSketch(
  //             geometry: trace.points,
  //             mobilityType: trace.mobilityType,
  //           ),
  //
  //           then: (current, segment) {
  //             final editor = current.modeAs<SketchMode>();
  //             if (editor == null) return null;
  //             return Transition.to(TripEditMode(editor.tripId)).and(
  //               selectionSlot,
  //               MapSegment(tripId: editor.tripId, id: segment.id),
  //             );
  //           },
  //         );
  //       });
}
