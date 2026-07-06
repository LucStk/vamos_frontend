part of "events.dart";

sealed class CursorEvent extends MapEvent {
  const CursorEvent();
}

class CursorDraggedStart extends CursorEvent {}

class CursorDraggedEnd extends CursorEvent {
  final LatLng latLng;
  const CursorDraggedEnd(this.latLng);
}

class CursorTapped extends CursorEvent {
  final LatLng latLng;
  const CursorTapped(this.latLng);
}

class CursorDoubleTapped extends CursorEvent {
  final LatLng latLng;
  const CursorDoubleTapped(this.latLng);
}
