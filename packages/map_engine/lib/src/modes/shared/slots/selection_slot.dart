import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';

const selectionSlot = Slot<Selectable>('selection');

extension TransitionSelection on Transition {
  static DeferredTransition withSelection<T extends Selectable>(
    Transition? Function(T value) build,
  ) => Transition.withSlot<Selectable>(selectionSlot, (st) {
    return (st is T) ? build(st) : null;
  });
}
