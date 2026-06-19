import 'package:vamos_cartographie/features/map/application/commands/commands.dart';
import 'package:vamos_cartographie/features/map/domain/state/map_mode.dart';
import 'package:vamos_cartographie/features/map/application/handlers/transition_result.dart';

TransitionResult reduceSegment(MapMode state, MapCommand command) {
  return switch (state) {
    SegmentSelected s => _reduceSegmentSelected(s, command),
    CreatingSegment s => _reduceCreatingSegment(s, command),
    SplittingSegment s => _reduceSplittingSegment(s, command),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult _reduceSegmentSelected(
  SegmentSelected state,
  MapCommand command,
) {
  // Handle segment selected state
  return TransitionResult(nextState: state);
}

TransitionResult _reduceCreatingSegment(
  CreatingSegment state,
  MapCommand command,
) {
  // Handle creating segment state
  return TransitionResult(nextState: state);
}

TransitionResult _reduceSplittingSegment(
  SplittingSegment state,
  MapCommand command,
) {
  // Handle splitting segment state
  return TransitionResult(nextState: state);
}
