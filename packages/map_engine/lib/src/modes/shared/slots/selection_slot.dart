import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';

const selectionSlot = Slot<MapObject>('selection');

extension TransitionSelection on Transition {
  static DeferredTransition withSelection<T extends MapObject>(
    Transition? Function(T value) build,
  ) => Transition.withSlot<MapObject>(selectionSlot, (st) {
    return (st is T) ? build(st) : null;
  });
}
