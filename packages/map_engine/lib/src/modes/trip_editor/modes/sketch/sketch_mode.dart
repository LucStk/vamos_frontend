part of "../../map_editor_mode.dart";

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

/// Réaction commune : un effet terminé avec succès ramène à Idle,
/// sauf si on a déjà quitté le sketch.
GestureResult<MapEditorMode>? leaveSketch(MapEditorMode current, Object _) =>
    current is SketchMode ? GestureResult.to(IdleEditor()) : null;

mixin SketchMode on MapEditorMode {
  List<LatLng> get path;
  VertexId? get touchedVertex;

  SketchMode withPath(List<LatLng> path);

  SketchMode withSelection(MapObject? selection);

  LatLng? get pencilPositionOrNull => path.isEmpty ? null : path.last;

  /// Le point est ajouté au tracé du mode COURANT, pas à celui qui a lancé l'effet.
  GestureResult<MapEditorMode> addPoint(
    ScreenOffset p, {
    MapEditorMode? mode,
  }) => GestureResult.run(
    AddPointToSketchSegment(p),
    mode: mode,
    then: (current, latLng) => switch (current) {
      SketchMode s => GestureResult<MapEditorMode>.to(
        s.withPath([...s.path, latLng]),
      ),
      _ => null,
    },
  );

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapSketchPencil p => GestureResult.to(withSelection(p)),
    _ => GestureResult.none(),
  };

  // @override
  // GestureResult<MapEditorMode> onDragStart(DragStartGesture g) =>
  //     selection is MapSketchPencil
  //     ? GestureResult.to(withSelection(null))
  //     : GestureResult.none();

  @override
  GestureResult<MapEditorMode> onDragging(DraggingGesture g, ScreenOffset p) =>
      g.dragged is MapSketchPencil
      ? addPoint(p, mode: withSelection(g.target))
      : GestureResult.none();
}

mixin ScreenProjector {
  LatLng? Function(ScreenOffset) get screenToLatLng;
}

mixin SketchResolver on GraphReader, ScreenProjector {
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
      screenToLatLng(c.screenOffset);
}
