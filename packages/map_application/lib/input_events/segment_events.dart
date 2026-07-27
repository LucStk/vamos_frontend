part of "input_events.dart";

sealed class SegmentEvent extends MapInputEvent {
  const SegmentEvent();
}

class HoverSegments extends SegmentEvent {
  final List<SegmentId>? listSegmentsId;
  const HoverSegments(this.listSegmentsId);
}

class SegmentMobilityMarkerTapped extends SegmentEvent {
  final SegmentId segmentId;
  const SegmentMobilityMarkerTapped(this.segmentId);
}

class SegmentMobilityMarkerDoubleTapped extends SegmentEvent {
  final SegmentId segmentId;
  const SegmentMobilityMarkerDoubleTapped(this.segmentId);
}

class ConnectionDragStart extends SegmentEvent {
  final VertexId vertexId;
  const ConnectionDragStart(this.vertexId);
}

class ConnectionDragUpdate extends SegmentEvent {
  final VertexId vertexId;
  const ConnectionDragUpdate(this.vertexId);
}

class ConnectionDragEnd extends SegmentEvent {
  final VertexId vertexId;
  const ConnectionDragEnd(this.vertexId);
}

class SegmentTapped extends SegmentEvent {
  final SegmentId segId;
  const SegmentTapped(this.segId);
}

class SegmentButtonDeleteTapped extends SegmentEvent {
  const SegmentButtonDeleteTapped();
}

class SegmentCreated implements SegmentEvent {
  final SegmentId segmentId;
  const SegmentCreated(this.segmentId);
}

class SegmentCreateFailed implements SegmentEvent {
  const SegmentCreateFailed();
}

class SegmentMobilityTypeChanged implements SegmentEvent {
  final MobilityType type;
  const SegmentMobilityTypeChanged(this.type);
}

class SegmentRedrawButtonTapped implements SegmentEvent {
  final SegmentId segmentId;
  const SegmentRedrawButtonTapped(this.segmentId);
}
