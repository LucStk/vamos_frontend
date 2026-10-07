part of "../../map_editor_mode.dart";

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
