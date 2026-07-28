part of "input_events.dart";

sealed class SketchEvent extends MapInputEvent {
  const SketchEvent();
}

class HoverSketchItineraire extends SketchEvent {
  const HoverSketchItineraire();
}

class SketchDraggedStart extends SketchEvent {}

class SketchDraggedEnd extends SketchEvent {
  final LatLng latLng;
  const SketchDraggedEnd(this.latLng);
}

class SketchDragUpdate extends MapInputEvent {
  final LatLng latLng;
  final VertexId? touchedVertex;
  const SketchDragUpdate({required this.latLng, this.touchedVertex});
}

class PencilTapped extends SketchEvent {
  final LatLng latLng;
  const PencilTapped(this.latLng);
}

class PencilDoubleTapped extends SketchEvent {
  final LatLng latLng;
  const PencilDoubleTapped(this.latLng);
}

class PencilButtonCreateTapped extends SketchEvent {
  const PencilButtonCreateTapped();
}

class SketchCancelButtonTapped extends SketchEvent {
  const SketchCancelButtonTapped();
}

class SketchSegmentTapped extends SketchEvent {
  final LatLng latLng;
  const SketchSegmentTapped(this.latLng);
}
