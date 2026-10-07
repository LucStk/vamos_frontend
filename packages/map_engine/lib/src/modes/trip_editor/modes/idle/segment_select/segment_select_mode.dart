part of "../../../map_editor_mode.dart";

// segment_select_mode.dart
@freezed
final class SegmentSelectMode extends MapEditorMode
    with IdleBehavior, _$SegmentSelectMode {
  SegmentSelectMode({required this.segment, this.popUpPosition});

  final MapSegment segment;

  @override
  final PopUpPositionType popUpPosition;

  @override
  SegmentSelectMode withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);
}
