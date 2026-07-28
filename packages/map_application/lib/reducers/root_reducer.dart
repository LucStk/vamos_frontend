import 'package:map_application/map_application.dart';
import "idle/idle_reducer.dart";
import "sketch/sketch_reducer.dart";

TransitionResult reduce(MapState state, MapEvent event) {
  return switch (state.mode) {
    Idle _ => reduceIdle(state, event),
    Sketch _ => reduceSketch(state, event),
  };
}
