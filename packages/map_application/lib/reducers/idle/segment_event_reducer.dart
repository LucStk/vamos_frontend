import 'package:map_application/intents/intents.dart';
import '/domain/domain.dart';
import "/events/events.dart";

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
        intents: [DeleteSegment(segmentId: segmentId)],
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
