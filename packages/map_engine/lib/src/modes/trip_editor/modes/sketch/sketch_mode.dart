part of "../../map_editor_mode.dart";

/// Réaction commune : un effet terminé avec succès ramène à Idle,
/// sauf si on a déjà quitté le sketch.
Transition<MapEditorMode>? leaveSketch(MapEditorMode current, Object _) =>
    current is SketchMode ? Transition.to(IdleEditor()) : null;

mixin SketchMode on MapEditorMode {
  List<LatLng> get path;
  VertexId? get touchedVertex;

  SketchMode withPath(List<LatLng> path);

  SketchMode withSelection(MapObject? selection);

  LatLng? get pencilPositionOrNull => path.isEmpty ? null : path.last;

  /// Le point est ajouté au tracé du mode COURANT, pas à celui qui a lancé l'effet.
  Transition<MapEditorMode> addPoint(ScreenOffset p, {MapEditorMode? mode}) =>
      Transition.run(
        AddPointToSketchSegment(p),
        mode: mode,
        then: (current, latLng) => switch (current) {
          SketchMode s => Transition<MapEditorMode>.to(
            s.withPath([...s.path, latLng]),
          ),
          _ => null,
        },
      );

  @override
  Transition<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapSketchPencil p => Transition.to(withSelection(p)),
    _ => Transition.none(),
  };

  // @override
  // Transition<MapEditorMode> onDragStart(DragStartGesture g) =>
  //     selection is MapSketchPencil
  //     ? Transition.to(withSelection(null))
  //     : Transition.none();

  @override
  Transition<MapEditorMode> onDragging(DraggingGesture g, ScreenOffset p) =>
      g.dragged is MapSketchPencil
      ? addPoint(p, mode: withSelection(g.target))
      : Transition.none();
}
