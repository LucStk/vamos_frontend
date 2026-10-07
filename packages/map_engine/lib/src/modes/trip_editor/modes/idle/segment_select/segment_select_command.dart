part of "/src/modes/trip_editor/map_editor_command.dart";

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

mixin SegmentSelectResolver {
  GraphEditor get graphEditor;
  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
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
