import 'package:latlong2/latlong.dart';
import 'package:map_application/hit_engine/hit_model.dart';

sealed class MapEvent {
  const MapEvent();
}

sealed class MapInputEvent extends MapEvent {
  const MapInputEvent();
}

class TapEvent extends MapInputEvent {
  final MapElement tappedElement;
  final LatLng latLng;
  const TapEvent(this.tappedElement, this.latLng);
}

class DragStartEvent extends MapInputEvent {
  final MapElement dragElement;
  const DragStartEvent(this.dragElement);
}

class DragUpdateEvent extends MapInputEvent {
  final LatLng latLng;
  final MapElement dragElement;
  const DragUpdateEvent(this.dragElement, this.latLng);
}

class DragEndEvent extends MapInputEvent {
  final MapElement dragElement;
  final LatLng latLng;
  const DragEndEvent(this.dragElement, this.latLng);
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
