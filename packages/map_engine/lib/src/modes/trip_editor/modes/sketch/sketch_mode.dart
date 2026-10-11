part of "../../map_editor_mode.dart";

/// Réaction commune : un effet terminé avec succès ramène à Idle,
/// sauf si on a déjà quitté le sketch.
Transition<MapEditorMode>? leaveSketch(MapEditorMode current, Object _) =>
    current is SketchMode ? Transition.to(IdleEditor()) : null;

mixin SketchMode on MapEditorMode {
  @override
  Transition<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapSketchPencil _ => Transition.overlay(SketchPencilMenu(g.screen)),
    _ => Transition.stay(),
  };

  // @override
  // Transition<MapEditorMode> onDragStart(DragStartGesture g) =>
  //     selection is MapSketchPencil
  //     ? Transition.to(withSelection(null))
  //     : Transition.stay();

  // @override
  // Transition<MapEditorMode> onDragging(DragUpdateGesture g) =>
  //     g.dragged is MapSketchPencil
  //     ? addPoint(g.offset, mode: withSelection(g.target))
  //     : Transition.stay();
}
