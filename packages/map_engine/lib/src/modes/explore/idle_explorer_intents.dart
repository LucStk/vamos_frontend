import 'package:trip_application/trip_application.dart';

import '../../domain/selection.dart';
import '/src/domain/objects/map_objects.dart';
import '../../mode_machine/transition.dart';
import 'map_explore_mode.dart';

abstract final class IdleExplorerIntents {
  static Transition<MapExploreMode> selectTrip(TripId tripId) =>
      Transition.set(selectionSlot, MapTrip(tripId));
}
