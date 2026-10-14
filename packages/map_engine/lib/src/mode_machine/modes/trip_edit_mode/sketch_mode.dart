part of "../../app_mode.dart";

mixin SketchMode on TripMode {
  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapSketchPencil _ => Transition.overlay(PencilMenu(g.screen)),
    _ => Transition.stay(),
  };

  // @override
  // Transition<AppMode> onDragStart(DragStartGesture g) =>
  //     selection is MapSketchPencil
  //     ? Transition.to(withSelection(null))
  //     : Transition.stay();

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      g.dragged is MapSketchPencil
      ? Transition.withSlot(sketchTraceSlot, (trace) {
          final t = trace.add(g.position.world);
          return Transition.set(sketchTraceSlot, t);
        })
      : Transition.stay();

  static Transition<AppMode> changeSegmentType(MobilityType type) =>
      Transition.withMode<AppMode, SketchEdition>(
        (s) => Transition.run(ChangeType(segmentId: s.segmentId, type: type)),
      );

  static Transition<AppMode> stopSketch() =>
      Transition.withMode<AppMode, SketchEdition>(
        (s) => Transition.to(
          TripEditMode(s.tripId),
        ).and(selectionSlot, MapSegment(tripId: s.tripId, id: s.segmentId)),
      );
}
