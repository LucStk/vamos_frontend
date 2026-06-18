part of "ui_events.dart";

class CursorDraggedStart extends MapUiEvent {}

class CursorDraggedend extends MapUiEvent {
  final LatLng latLng;
  const CursorDraggedend(this.latLng);
}

class CursorTapped extends MapUiEvent {}
