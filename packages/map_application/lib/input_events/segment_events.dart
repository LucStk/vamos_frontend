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
