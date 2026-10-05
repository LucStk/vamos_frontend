import 'package:map_engine/map_engine.dart';

typedef PopUpPositionType = ScreenOffset?;

abstract class BaseMode<Self extends BaseMode<Self>> {
  const BaseMode();
  PopUpPositionType get popUpPosition;
  MapObject? get selection;

  Self withSelection(MapObject? selection);

  /// Le seul point d'entrée vers le mode.
  /// `null` = événement ignoré par ce mode.
  GestureResult<Self>? reduce(ModeEvent event) => switch (event) {
    GestureEvent(:final gesture, :final offset) => dispatchGesture(
      gesture,
      offset,
    ),
    CommandResultEvent(:final result) => onCommandResult(result),
    IntentEvent(:final intent) => onIntent(intent),
  };

  // Hook 1 : gestes (inchangé)
  GestureResult<Self>? dispatchGesture(
    MapGesture gesture,
    ScreenOffset offset,
  ) {
    return switch (gesture) {
      PointerDownGesture() => onPointerDown(gesture, offset),
      DragStartGesture() => onDragStart(gesture),
      DraggingGesture() => onDragging(gesture, offset),
      DragEndGesture() => onDragEnd(gesture),
      TapGesture() => onTap(gesture),
      DoubleTapGesture() => null,
    };
  }

  // Hook 2 : résultats de commandes. Retourne une transition,
  // donc peut aussi enchaîner une nouvelle commande si besoin.
  GestureResult<Self>? onCommandResult(CommandResult result) =>
      switch (result) {
        SegmentDeleted(:final segmentId) => switch (selection) {
          MapSegment(:final id) when id == segmentId => _deselect(),
          _ => null,
        },
        VertexRemoved(:final vertexId) => switch (selection) {
          MapVertex(:final id) when id == vertexId => _deselect(),
          _ => null,
        },
        SegmentCreated() ||
        SegmentSpliced() ||
        SegmentUpdated() ||
        SegmentCorrected() ||
        TripSelected() ||
        NoResult() => null,
      };

  GestureResult<Self> _deselect() =>
      GestureResult<Self>.to(withSelection(null));

  // Hook 3 : intentions UI. Par défaut, un mode ignore ce qu'il ne connaît pas.
  GestureResult<Self>? onIntent(ModeIntent intent) => null;

  GestureResult<Self> onPointerDown(PointerDownGesture g, ScreenOffset p) =>
      GestureResult.none();
  GestureResult<Self> onDragStart(DragStartGesture g) => GestureResult.none();
  GestureResult<Self> onDragging(DraggingGesture g, ScreenOffset p) =>
      GestureResult.none();
  GestureResult<Self> onDragEnd(DragEndGesture g) => GestureResult.none();
  GestureResult<Self> onTap(TapGesture g) => GestureResult.none();
}
