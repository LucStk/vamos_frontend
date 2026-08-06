import 'package:map_application/hit_engine/hit_model.dart';
import 'package:map_application/map_editor.dart';

import '/domain/domain.dart';
import "/events/events.dart";

TransitionResult reduceTapInputEvents(MapState state, TapEvent event) {
  return switch (event.tappedElement) {
    MapCursor e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.none(),
      ),
    ),
    MapSegment e => TransitionResult(
      nextState: state.copyWith(
        selection: SegmentSelection(segmentId: e.segmentId),
      ),
    ),
    MapVertex e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.vertex(vertex: e.vertex),
      ),
    ),
    _ => TransitionResult(nextState: state),
  };
}
