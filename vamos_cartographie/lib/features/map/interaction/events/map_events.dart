part of 'events.dart';

class MapTapped extends MapInteractionEvent {
  final LatLng position;

  const MapTapped(this.position);
}
