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

sealed class SegmentSelectCommand<R extends Object> extends EditorCommand<R> {
  const SegmentSelectCommand();
}

final class DeleteSegment extends SegmentSelectCommand<Done> {
  const DeleteSegment(this.segmentId);
  final SegmentId segmentId;
}

final class ChangeSegmentType extends SegmentSelectCommand<Done> {
  const ChangeSegmentType(this.segmentId, this.mobilityType);
  final SegmentId segmentId;
  final MobilityType mobilityType;
}

extension SegmentSelectIntents on SegmentSelectMode {
  GestureResult<MapEditorMode> deleteSegment() {
    final id = segment.id; // on capture une valeur, jamais `this`
    return GestureResult.run(
      DeleteSegment(id),
      then: (current, _) => switch (current) {
        SegmentSelectMode(:final segment) when segment.id == id =>
          GestureResult.to(IdleEditor()),
        _ => null, // le mode a changé : rien à faire
      },
    );
  }

  GestureResult<MapEditorMode> changeSegmentType(MobilityType type) =>
      GestureResult.run(ChangeSegmentType(segment.id, type));

  GestureResult<MapEditorMode> startSegmentEdit() =>
      GestureResult.to(SketchEdition(segmentId: segment.id, path: []));
}

mixin SegmentSelectResolver on GraphReader {
  Future<Object?> resolveSegmentSelect(SegmentSelectCommand command) =>
      switch (command) {
        DeleteSegment(:final segmentId) => _delete(segmentId),
        ChangeSegmentType(:final segmentId, :final mobilityType) => _changeType(
          segmentId,
          mobilityType,
        ),
      };

  Future<Done?> _delete(SegmentId id) async {
    await graphEditor.deleteSegment(id);
    return const Done();
  }

  Future<Done?> _changeType(SegmentId id, MobilityType type) async {
    final s = segment(id);
    if (s == null) return null;
    await graphEditor.updateSegment(
      SegmentPatchModel.fromFields(s).copyWith(mobilityType: type),
    );
    return const Done();
  }
}
