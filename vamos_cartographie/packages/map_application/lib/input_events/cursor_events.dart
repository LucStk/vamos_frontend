part of "input_events.dart";

sealed class CursorEvent extends MapInputEvent {
  const CursorEvent();
}

class CursorDraggedStart extends CursorEvent {}

class CursorDraggedEnd extends CursorEvent {
  final LatLng latLng;
  const CursorDraggedEnd(this.latLng);
}

class CursorDragUpdate extends CursorEvent {
  final LatLng latLng;
  const CursorDragUpdate(this.latLng);
}

class CursorTapped extends CursorEvent {
  final LatLng latLng;
  const CursorTapped(this.latLng);
}

class CursorDoubleTapped extends CursorEvent {
  final LatLng latLng;
  const CursorDoubleTapped(this.latLng);
}

class CursorButtonCreateTapped extends CursorEvent {
  const CursorButtonCreateTapped();
}
