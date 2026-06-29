part of 'intents.dart';

class PutCursor extends MapIntents {
  final LatLng latLng;
  const PutCursor(this.latLng);
}

class OpenWaypointDialog extends MapIntents {
  final int waypointId;
  const OpenWaypointDialog(this.waypointId);
}

class OpenWaypointEditor extends MapIntents {
  final int waypointId;
  const OpenWaypointEditor(this.waypointId);
}
