part of "events.dart";

sealed class SegmentEvent extends MapEvent {
  const SegmentEvent();
}

class HoverSegments extends SegmentEvent {
  final List<SegmentRef>? listSegmentsId;
  const HoverSegments(this.listSegmentsId);
}

class SegmentMobilityMarkerTapped extends SegmentEvent {
  final SegmentRef segmentRef;
  const SegmentMobilityMarkerTapped(this.segmentRef);
}

class SegmentMobilityMarkerDoubleTapped extends SegmentEvent {
  final SegmentRef segmentRef;
  const SegmentMobilityMarkerDoubleTapped(this.segmentRef);
}
