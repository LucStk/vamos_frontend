import 'package:map_application/map_application.dart';
import "idle_reducer.dart";
import "sketch_reducer.dart";

TransitionResult reduce(MapState state, MapInputEvent event) {
  return switch (state.mode) {
    Idle _ => reduceIdle(state, event),
    SketchMode _ => reduceSketch(state, event),
  };
}
