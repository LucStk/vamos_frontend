part of "../trip_edit_mode.dart";

/// Réaction commune : un effet terminé avec succès ramène à Idle,
/// sauf si on a déjà quitté le sketch.
Transition<TripEditMode>? leaveSketch(
  ModeState<TripEditMode> current,
  Object _,
) => current is SketchMode ? Transition.to(IdleEditor()) : null;

mixin SketchMode on TripEditMode {
  @override
  Transition<TripEditMode> onTap(TapGesture g) => switch (g.element) {
    MapSketchPencil _ => Transition.overlay(PencilMenu(g.screen)),
    _ => Transition.stay(),
  };

  // @override
  // Transition<TripEditMode> onDragStart(DragStartGesture g) =>
  //     selection is MapSketchPencil
  //     ? Transition.to(withSelection(null))
  //     : Transition.stay();

  @override
  Transition<TripEditMode> onDragging(DragUpdateGesture g) =>
      g.dragged is MapSketchPencil
      ? Transition.withSlot(sketchTraceSlot, (trace) {
          final t = trace.add(g.position.world);
          return Transition.set(sketchTraceSlot, t);
        })
      : Transition.stay();

  static Transition<TripEditMode> changeSegmentType(MobilityType type) =>
      Transition.withMode<TripEditMode, SketchEdition>(
        (s) => Transition.run(ChangeType(segmentId: s.segmentId, type: type)),
      );

  static Transition<TripEditMode> stopSketch() =>
      Transition.withMode<TripEditMode, SketchEdition>(
        (s) => Transition.to(
          IdleEditor(),
        ).and(selectionSlot, MapSegment(s.segmentId)),
      );
}
