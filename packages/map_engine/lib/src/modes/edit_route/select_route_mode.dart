import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/slots/route_selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/edit_route/slots/mobility_span_slot.dart';

class SelectRouteMode extends TripMode {
  SelectRouteMode(super.tripId, {required this.spanStartIndex});

  final int spanStartIndex;

  @override
  Set<Slot> get retainedSlots => {mobilitySpanSlot};

  @override
  Iterable<SlotChange> get initialSlots => [
    (
      routeSelectionSlot,
      RouteSelection(startIndex: spanStartIndex, endIndex: spanStartIndex),
    ),
  ];
}
