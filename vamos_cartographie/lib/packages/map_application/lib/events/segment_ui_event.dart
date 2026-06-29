part of "ui_events.dart";

class HoverSegments extends MapUiEvent {
  final List<SegmentUiId>? listSegmentsId;
  const HoverSegments(this.listSegmentsId);
}

class SegmentMobilityMarkerTapped extends MapUiEvent {
  final SegmentUiId segmentUiId;
  const SegmentMobilityMarkerTapped(this.segmentUiId);
}

class SegmentMobilityMarkerDoubleTapped extends MapUiEvent {
  final SegmentUiId segmentUiId;
  const SegmentMobilityMarkerDoubleTapped(this.segmentUiId);
}
