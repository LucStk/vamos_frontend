import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

//Ici on capture exactement ce que Flutter observe.
sealed class MapUiEvent {
  const MapUiEvent();
}

class MapTapped extends MapUiEvent {
  final LatLng latLng;
  const MapTapped(this.latLng);
}

class WaypointTapped extends MapUiEvent {
  final Id<Waypoint> waypointId;
  const WaypointTapped(this.waypointId);
}

class WaypointDoubleTapped extends MapUiEvent {
  final Id<Waypoint> waypointId;
  const WaypointDoubleTapped(this.waypointId);
}
