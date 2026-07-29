part of "events.dart";

sealed class SketchInputEvent extends MapInputEvent {
  const SketchInputEvent();
}

class SketchPencilDraggedStart extends SketchInputEvent {}

class SketchModeActivate extends SketchInputEvent {
  const SketchModeActivate();
}

class SketchModeDeactivate extends SketchInputEvent {
  const SketchModeDeactivate();
}

class SketchPencilDraggedEnd extends SketchInputEvent {
  final LatLng latLng;
  const SketchPencilDraggedEnd(this.latLng);
}

class SketchPencilDragUpdate extends SketchInputEvent {
  final LatLng latLng;
  final VertexId? touchedVertex;
  const SketchPencilDragUpdate({required this.latLng, this.touchedVertex});
}

class SketchCancelButtonTapped extends SketchInputEvent {
  const SketchCancelButtonTapped();
}

class SketchSegmentTapped extends SketchInputEvent {
  final LatLng latLng;
  const SketchSegmentTapped(this.latLng);
}

class PencilTapped extends SketchInputEvent {
  final LatLng latLng;
  const PencilTapped(this.latLng);
}

class PencilDoubleTapped extends SketchInputEvent {
  final LatLng latLng;
  const PencilDoubleTapped(this.latLng);
}

class PencilButtonCreateTapped extends SketchInputEvent {
  const PencilButtonCreateTapped();
}
