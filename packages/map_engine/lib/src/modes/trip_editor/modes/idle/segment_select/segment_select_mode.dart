part of "../../../map_editor_mode.dart";

// segment_select_mode.dart
@freezed
final class SegmentSelectMode extends MapEditorMode
    with IdleBehavior, _$SegmentSelectMode {
  SegmentSelectMode({required this.segment});

  final MapSegment segment;
}
