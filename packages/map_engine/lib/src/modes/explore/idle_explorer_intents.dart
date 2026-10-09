import '../../domain/selection.dart';
import '/src/domain/objects/map_objects.dart';
import '../../mode_machine/transition.dart';
import 'map_explore_mode.dart';

abstract final class IdleExplorerIntents {
  static Transition<MapExploreMode> selectTrip(MapTripObject trip) =>
      Transition.set(selectionSlot, TripSelection(trip.id));
}
