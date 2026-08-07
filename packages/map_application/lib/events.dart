import 'package:latlong2/latlong.dart';

sealed class MapEvent {
  const MapEvent();
}

sealed class MapInputEvent extends MapEvent {
  const MapInputEvent();
}

sealed class MapOutputEvent extends MapEvent {
  const MapOutputEvent();
}

class MapTapped extends MapEvent {
  final LatLng latLng;
  const MapTapped(this.latLng);
}

// class ShowError extends MapEvent {
//   final String message;
//   const ShowError(this.message);
// }
