part of "/src/modes/trip_editor/map_editor_command.dart";

sealed class SketchCommand<R extends Object> extends EditorCommand<R> {
  const SketchCommand();
}

final class CreateSegmentFromSketch extends SketchCommand<SegmentRemoteModel> {
  const CreateSegmentFromSketch({
    required this.startVertexId,
    required this.geometry,
    required this.mobilityType,
    this.endVertexId,
  });
  final VertexId startVertexId;
  final VertexId? endVertexId;
  final List<LatLng> geometry;
  final MobilityType mobilityType;
}

final class SpliceSegment extends SketchCommand<SegmentId> {
  const SpliceSegment({
    required this.segmentId,
    required this.correction,
    required this.startAnchor,
    required this.endAnchor,
  });
  final SegmentId segmentId;
  final List<LatLng> correction;
  final SpliceAnchor startAnchor;
  final SpliceAnchor endAnchor;
}

final class EditSegmentFromSketch extends SketchCommand<Done> {
  const EditSegmentFromSketch(this.patch);
  final SegmentPatchModel patch;
}

final class CorrectSegmentFromSketch extends SketchCommand<Done> {
  const CorrectSegmentFromSketch({
    required this.segmentId,
    required this.correction,
  });
  final SegmentId segmentId;
  final List<LatLng> correction;
}

/// Projette un point écran en coordonnée géo ; le mode ajoute le résultat à son tracé.
final class AddPointToSketchSegment extends SketchCommand<LatLng> {
  const AddPointToSketchSegment(this.screenOffset);
  final ScreenOffset screenOffset;
}

mixin SketchResolver {
  GraphEditor get graphEditor;
  MapCameraController get camera;
  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
  Future<Object?> resolveSketch(SketchCommand command) => switch (command) {
    CreateSegmentFromSketch c => _create(c),
    SpliceSegment c => _splice(c),
    EditSegmentFromSketch c => _edit(c),
    CorrectSegmentFromSketch c => _correct(c),
    AddPointToSketchSegment c => _project(c),
  };

  Future<SegmentRemoteModel?> _create(CreateSegmentFromSketch c) async {
    final res = await graphEditor.createSegment(
      startVertexId: c.startVertexId,
      endVertexId: c.endVertexId,
      geometry: c.geometry,
      mobilityType: c.mobilityType,
    );
    return res.fold((_) => null, (d) => d.segment);
  }

  Future<SegmentRemoteModel?> _splice(SpliceSegment c) async {
    final s = segment(c.segmentId);
    if (s == null) return null;
    final res = await graphEditor.spliceSegment(
      correction: c.correction,
      mobilityType: s.mobilityType,
      startAnchor: c.startAnchor,
      endAnchor: c.endAnchor,
    );
    return res.fold((_) => null, (d) => d.$2);
  }

  Future<Done?> _edit(EditSegmentFromSketch c) async =>
      (await graphEditor.updateSegment(
        c.patch,
      )).fold((_) => null, (_) => const Done());

  Future<Done?> _correct(CorrectSegmentFromSketch c) async {
    final s = segment(c.segmentId);
    if (s == null) return null;
    final patch = SegmentPatchModel.fromFields(
      s,
    ).copyWith(geometry: mergeCorrection(c.correction, s.geometry));
    return (await graphEditor.correctSegment(
      patch,
      c.correction,
    )).fold((_) => null, (_) => const Done());
  }

  Future<LatLng?> _project(AddPointToSketchSegment c) async =>
      camera.screenOffsetToLatLng(c.screenOffset);
}
