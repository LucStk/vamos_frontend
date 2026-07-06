part of 'intents.dart';

class PutCursor extends MapIntents {
  final LatLng latLng;
  const PutCursor(this.latLng);
}

class OpenWaypointDialog extends MapIntents {
  final WaypointId waypointId;
  const OpenWaypointDialog(this.waypointId);
}

class OpenWaypointEditor extends MapIntents {
  final WaypointId waypointId;
  const OpenWaypointEditor(this.waypointId);
}
