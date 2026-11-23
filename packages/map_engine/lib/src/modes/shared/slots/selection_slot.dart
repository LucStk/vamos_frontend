import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/objects/trip_object.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';

const selectionSlot = Slot<MapObject>('selection');

/// Ce qui reste sélectionné en changeant de niveau (entrer dans un trip ou
/// en sortir) : le trip lui-même, jamais un jour, un morceau ou une étape.
MapObject? tripSelectionOnly(MapObject? selection) =>
    selection is MapTrip ? selection : null;

extension TransitionSelection on Transition {
  static DeferredTransition withSelection<T extends MapObject>(
    Transition? Function(T value) build,
  ) => Transition.withSlot<MapObject>(selectionSlot, (st) {
    return (st is T) ? build(st) : null;
  });
}
