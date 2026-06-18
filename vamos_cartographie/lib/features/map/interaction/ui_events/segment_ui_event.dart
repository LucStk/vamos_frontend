part of "ui_events.dart";

class HoverSegments extends MapUiEvent {
  final List<Id<Segment>>? listSegmentsId;
  const HoverSegments(this.listSegmentsId);
}

class SegmentMobilityMarkerTapped extends MapUiEvent {
  final Id<Segment> segmentId;
  const SegmentMobilityMarkerTapped(this.segmentId);
}
