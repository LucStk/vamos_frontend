part of "events.dart";

/// hover polyline (mousemove / pointer move)
class SegmentHoverChanged extends MapInteractionEvent {
  final LayerHitResult<Id<Segment>>? hitResult;

  const SegmentHoverChanged(this.hitResult);
}

/// click sur segment
class SegmentTapped extends MapInteractionEvent {
  final Id<Segment> segmentId;
  final Offset screenPosition;
  final MapCamera camera;

  const SegmentTapped({
    required this.segmentId,
    required this.screenPosition,
    required this.camera,
  });
}
