part of "events.dart";

sealed class SketchInputEvent extends MapInputEvent {
  const SketchInputEvent();
}

class SketchDraggedStart extends SketchInputEvent {}

class SketchDraggedEnd extends SketchInputEvent {
  final LatLng latLng;
  const SketchDraggedEnd(this.latLng);
}

class SketchDragUpdate extends SketchInputEvent {
  final LatLng latLng;
  final VertexId? touchedVertex;
  const SketchDragUpdate({required this.latLng, this.touchedVertex});
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

class SketchCancelButtonTapped extends SketchInputEvent {
  const SketchCancelButtonTapped();
}

class SketchSegmentTapped extends SketchInputEvent {
  final LatLng latLng;
  const SketchSegmentTapped(this.latLng);
}
