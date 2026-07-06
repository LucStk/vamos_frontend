part of "events.dart";

class MapTapped extends MapEvent {
  final LatLng latLng;
  const MapTapped(this.latLng);
}
