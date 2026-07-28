part of "../events.dart";

sealed class SegmentInputEvent extends MapInputEvent {
  const SegmentInputEvent();
}

class HoverSegments extends SegmentInputEvent {
  final List<SegmentId>? listSegmentsId;
  const HoverSegments(this.listSegmentsId);
}

class SegmentMobilityMarkerTapped extends SegmentInputEvent {
  final SegmentId segmentId;
  const SegmentMobilityMarkerTapped(this.segmentId);
}

class SegmentMobilityMarkerDoubleTapped extends SegmentInputEvent {
  final SegmentId segmentId;
  const SegmentMobilityMarkerDoubleTapped(this.segmentId);
}

class ConnectionDragStart extends SegmentInputEvent {
  final VertexId vertexId;
  const ConnectionDragStart(this.vertexId);
}

class ConnectionDragUpdate extends SegmentInputEvent {
  final VertexId vertexId;
  const ConnectionDragUpdate(this.vertexId);
}

class ConnectionDragEnd extends SegmentInputEvent {
  final VertexId vertexId;
  const ConnectionDragEnd(this.vertexId);
}

class SegmentTapped extends SegmentInputEvent {
  final SegmentId segId;
  const SegmentTapped(this.segId);
}

class SegmentButtonDeleteTapped extends SegmentInputEvent {
  const SegmentButtonDeleteTapped();
}

class SegmentMobilityTypeChanged extends SegmentInputEvent {
  final MobilityType type;
  const SegmentMobilityTypeChanged(this.type);
}

class SegmentRedrawButtonTapped extends SegmentInputEvent {
  final SegmentId segmentId;
  const SegmentRedrawButtonTapped(this.segmentId);
}
