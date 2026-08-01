import 'package:map_application/map_effects.dart';

import '/domain/domain.dart';
import "/events/events.dart";

import 'package:map_application/map_editor.dart';

TransitionResult reduceSegmentInputEvents(
  MapState state,
  SegmentInputEvent event,
) {
  return switch (event) {
    SegmentCreateFailed _ => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
    ),
    SegmentButtonDeleteTapped _ => switch (state.selection.segmentIdOrNull) {
      final segmentId? => TransitionResult(
        nextState: state.copyWith(selection: NoSelection()),
        effects: [DeleteSegment(segmentId)],
      ),
      null => TransitionResult(nextState: state),
    },
    SegmentTapped e => TransitionResult(
      nextState: state.copyWith(
        selection: SegmentSelection(segmentId: e.segId),
      ),
    ),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult reduceSegmentOutputEvents(
  MapState state,
  SegmentOutputEvent event,
) {
  return switch (event) {
    SegmentCreated e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.segment(segmentId: e.segmentId),
      ),
    ),
    SegmentCreateFailed _ => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
    ),
  };
}
