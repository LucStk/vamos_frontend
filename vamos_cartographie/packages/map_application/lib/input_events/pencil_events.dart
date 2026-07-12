part of "input_events.dart";

sealed class PencilEvent extends MapInputEvent {
  const PencilEvent();
}

class PencilDraggedStart extends PencilEvent {}

class PencilDraggedEnd extends PencilEvent {
  final LatLng latLng;
  const PencilDraggedEnd(this.latLng);
}

class PencilTapped extends PencilEvent {
  final LatLng latLng;
  const PencilTapped(this.latLng);
}

class PencilDoubleTapped extends PencilEvent {
  final LatLng latLng;
  const PencilDoubleTapped(this.latLng);
}

class PencilButtonCreateTapped extends PencilEvent {
  const PencilButtonCreateTapped();
}
