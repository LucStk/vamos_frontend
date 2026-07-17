import 'package:trip_application/waypoint/domain/domain.dart';

sealed class MapOutputEvent {
  const MapOutputEvent();
}

class OpenWaypointDialogEvent extends MapOutputEvent {
  final WaypointId waypointId;
  const OpenWaypointDialogEvent(this.waypointId);
}

class ShowError extends MapOutputEvent {
  final String message;

  const ShowError(this.message);
}
