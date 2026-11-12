import 'package:map_engine/src/modes/edit_route/slots/route_selection_slot.dart';

import 'package:map_engine/src/domain/objects/route/handle/route_handle.dart';
import 'package:trip_application/trip_application.dart';

final class SelectionHandle extends RouteHandle {
  SelectionHandle({required this.tripId, required this.id});

  final TripId tripId;
  final HandleId id;

  @override
  final bool isDraggable = true;

  @override
  bool operator ==(Object other) =>
      other is SelectionHandle && other.tripId == tripId && other.id == id;

  @override
  int get hashCode => Object.hash(tripId, id);
}
