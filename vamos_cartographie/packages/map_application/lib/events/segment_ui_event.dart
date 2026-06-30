part of "ui_events.dart";

class HoverSegments extends MapUiEvent {
  final List<SegmentRef>? listSegmentsId;
  const HoverSegments(this.listSegmentsId);
}

class SegmentMobilityMarkerTapped extends MapUiEvent {
  final SegmentRef segmentRef;
  const SegmentMobilityMarkerTapped(this.segmentRef);
}

class SegmentMobilityMarkerDoubleTapped extends MapUiEvent {
  final SegmentRef segmentRef;
  const SegmentMobilityMarkerDoubleTapped(this.segmentRef);
}
