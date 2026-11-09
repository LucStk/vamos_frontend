import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/slots/route_selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

class SelectRouteMode extends TripMode {
  SelectRouteMode(super.tripId, {required this.initialPosition});

  final double initialPosition;

  @override
  Iterable<SlotChange> get initialSlots => [
    (routeSelectionSlot, RouteSelection.collapsedAt(initialPosition)),
  ];
}
