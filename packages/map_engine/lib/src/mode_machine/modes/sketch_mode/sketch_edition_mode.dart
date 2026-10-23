part of "../../app_mode.dart";

final class SketchEdition extends TripEditableMode {
  const SketchEdition(super.tripId);

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapWaypoint e => Transition.overlay(WaypointMenu(e)),
    MapSketchPencil p => Transition.overlay(PencilMenu(p)),
    _ => Transition.stay(),
  };

  /// On saisit le segment : le tracé démarre à ce point.
  @override
  Transition<AppMode> onPointerDown(PressGesture g) => switch (g.element) {
    MapSegment() => Transition.set(
      sketchTraceSlot,
      SketchTrace.from(g.position.world),
    ),
    _ => Transition.stay(),
  };

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      g.dragged is MapSketchPencil
      ? Transition.update(sketchTraceSlot, (t) => t.add(g.position.world))
      : Transition.stay();

  // --- Intents ---
  static Transition<AppMode> start(TripId tripId, WorldOffset from) =>
      Transition.to<AppMode>(
        SketchEdition(tripId),
      ).and(sketchTraceSlot, SketchTrace.from(from));

  static Transition<AppMode> stop() =>
      Transition.withMode<AppMode, SketchEdition>(
        (s) => Transition.to(TripActiveMode(s.tripId)),
      );
}
