import '../../domain/selection.dart';
import '/src/domain/objects/map_objects.dart';
import '../../mode_machine/gesture_result.dart';
import 'map_explore_mode.dart';

abstract final class IdleExplorerIntents {
  static GestureResult<MapExploreMode> selectTrip(MapTripObject trip) =>
      GestureResult.set(selectionSlot, TripSelection(trip.id));
}
