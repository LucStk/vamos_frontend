part of "../../map_editor_mode.dart";

sealed class SegmentSelectCommand extends EditorCommand {
  const SegmentSelectCommand();
}

final class DeleteSegment extends SegmentSelectCommand {
  const DeleteSegment(this.segmentId);
  final SegmentId segmentId;
}

final class ChangeSegmentType extends SegmentSelectCommand {
  const ChangeSegmentType(this.segmentId, this.mobilityType);
  final SegmentId segmentId;
  final MobilityType mobilityType;
}

@freezed
final class SegmentSelectMode extends IdleEditor with _$SegmentSelectMode {
  SegmentSelectMode({required this.segment});
  final MapSegment segment;

  BaseMode? dispatchCommandPayload(EditorModeCommandPayload result) =>
      switch (result) {
        SegmentDeleted(:final segmentId) when segmentId == segment.id =>
          IdleEditor(),
        _ => null,
      };
}

extension SegmentSelectIntents on SegmentSelectMode {
  GestureResult<MapEditorMode> deleteVertex() =>
      GestureResult.run(DeleteSegment(segment.id));

  GestureResult<MapEditorMode> changeSegmentType(MobilityType type) =>
      GestureResult.run(ChangeSegmentType(segment.id, type));

  GestureResult<MapEditorMode> startSegmentEdit() =>
      GestureResult.to(SketchEdition(segmentId: segment.id, path: []));
}

mixin SegmentSelectResolver on GraphReader {
  Future<EditorModeCommandPayload> resolveSegmentSelect(
    SegmentSelectCommand command,
  ) => switch (command) {
    DeleteSegment(:final segmentId) => _delete(segmentId),
    ChangeSegmentType(:final segmentId, :final mobilityType) => _changeType(
      segmentId,
      mobilityType,
    ),
  };

  Future<EditorModeCommandPayload> _delete(SegmentId id) async {
    await graphEditor.deleteSegment(id);
    return SegmentDeleted(id);
  }

  Future<EditorModeCommandPayload> _changeType(
    SegmentId id,
    MobilityType type,
  ) async {
    final s = segment(id);
    if (s == null) return const NoResult();

    await graphEditor.updateSegment(
      SegmentPatchModel.fromFields(s).copyWith(mobilityType: type),
    );
    return const NoResult();
  }
}

final class SegmentDeleted extends EditorModeCommandPayload {
  const SegmentDeleted(this.segmentId);
  final SegmentId segmentId;
}
