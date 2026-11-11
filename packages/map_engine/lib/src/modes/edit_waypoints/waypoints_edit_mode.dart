import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/edit_span_mode.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

final class WaypointsEditMode extends TripMode {
  const WaypointsEditMode(super.tripId);
  @override
  Transition onTap(TapGesture g) => switch (g.hit) {
    HitObject(object: MapMobilitySpan(:final id, :final start, :final end)) =>
      Transition.to(
        EditSpanMode(tripId, mobilitySpanId: id, start: start, end: end),
      ),
    _ => Transition.stay(),
  };
}
