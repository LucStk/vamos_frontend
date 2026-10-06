part of '../view_trip_mode.dart';

@freezed
final class SegmentSelectViewMode extends ViewTripMode
    with IdleViewBehavior, _$SegmentSelectViewMode {
  SegmentSelectViewMode({required this.segment, this.popUpPosition});

  final MapSegment segment;

  @override
  final PopUpPositionType popUpPosition;

  @override
  SegmentSelectViewMode withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);
}
