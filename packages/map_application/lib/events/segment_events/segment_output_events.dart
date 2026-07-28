part of "../events.dart";

sealed class SegmentOutputEvent extends MapOutputEvent {
  const SegmentOutputEvent();
}

class SegmentCreated extends SegmentOutputEvent {
  final SegmentId segmentId;
  const SegmentCreated(this.segmentId);
}

class SegmentCreateFailed extends SegmentOutputEvent {
  const SegmentCreateFailed();
}

// class SegmentMobilityTypeChanged implements SegmentOutputEvent {
//   final MobilityType type;
//   const SegmentMobilityTypeChanged(this.type);
// } est déjà un inputEvent
