import 'package:domain_core/id.dart';
import 'package:trip_domain/trip_domain.dart';

sealed class MapOutputEvent {
  const MapOutputEvent();
}

class OpenWaypointDialogEvent extends MapOutputEvent {
  final Id<Waypoint> waypointId;
  const OpenWaypointDialogEvent(this.waypointId);
}

class ShowError extends MapOutputEvent {
  final String message;

  const ShowError(this.message);
}
