part of "ui_events.dart";

class CursorDraggedStart extends MapUiEvent {}

class CursorDraggedEnd extends MapUiEvent {
  final LatLng latLng;
  const CursorDraggedEnd(this.latLng);
}

class CursorTapped extends MapUiEvent {
  final LatLng latLng;
  const CursorTapped(this.latLng);
}

class CursorDoubleTapped extends MapUiEvent {
  final LatLng latLng;
  const CursorDoubleTapped(this.latLng);
}
