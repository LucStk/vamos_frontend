import '/features/map_editor/intents/intents.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/map_mode.dart';
import 'package:vamos_cartographie/features/map_editor/application/transition_result.dart';

TransitionResult reduceSegment(MapMode state, MapIntents intent) {
  return switch (state) {
    SegmentSelected s => _reduceSegmentSelected(s, intent),
    CreatingSegment s => _reduceCreatingSegment(s, intent),
    SplittingSegment s => _reduceSplittingSegment(s, intent),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult _reduceSegmentSelected(
  SegmentSelected state,
  MapIntents intent,
) {
  // Handle segment selected state
  return TransitionResult(nextState: state);
}

TransitionResult _reduceCreatingSegment(
  CreatingSegment state,
  MapIntents intent,
) {
  // Handle creating segment state
  return TransitionResult(nextState: state);
}

TransitionResult _reduceSplittingSegment(
  SplittingSegment state,
  MapIntents intent,
) {
  // Handle splitting segment state
  return TransitionResult(nextState: state);
}
