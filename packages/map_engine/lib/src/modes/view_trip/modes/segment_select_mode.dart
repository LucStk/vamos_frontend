part of '../view_trip_mode.dart';

@freezed
final class SegmentSelectViewMode extends ViewTripMode
    with IdleViewBehavior, _$SegmentSelectViewMode {
  SegmentSelectViewMode({required this.segment});

  final MapSegment segment;
}
