part of "../events.dart";

sealed class SegmentInputEvent extends MapInputEvent {
  const SegmentInputEvent();
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
