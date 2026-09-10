import 'package:latlong2/latlong.dart';

sealed class MapPointerEvent {
  final LatLng latLng;
  const MapPointerEvent(this.latLng);
}

class MapPointerDown extends MapPointerEvent {
  const MapPointerDown(super.latLng);
}

class MapPointerMove extends MapPointerEvent {
  const MapPointerMove(super.latLng);
}

class MapPointerUp extends MapPointerEvent {
  const MapPointerUp(super.latLng);
}
