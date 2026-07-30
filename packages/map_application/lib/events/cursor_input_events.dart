part of "events.dart";

sealed class CursorInputEvent extends MapInputEvent {
  const CursorInputEvent();
}

class CursorDraggedStart extends CursorInputEvent {
  final LatLng latLng;
  const CursorDraggedStart(this.latLng);
}

class CursorDraggedEnd extends CursorInputEvent {
  final LatLng latLng;
  const CursorDraggedEnd(this.latLng);
}

class CursorDragUpdate extends CursorInputEvent {
  final LatLng latLng;
  const CursorDragUpdate(this.latLng);
}

class CursorTapped extends CursorInputEvent {
  final LatLng latLng;
  const CursorTapped(this.latLng);
}

class CursorDoubleTapped extends CursorInputEvent {
  final LatLng latLng;
  const CursorDoubleTapped(this.latLng);
}

class CursorButtonCreateTapped extends CursorInputEvent {
  const CursorButtonCreateTapped();
}
