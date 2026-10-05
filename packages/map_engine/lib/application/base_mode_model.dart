import 'package:map_engine/map_engine.dart';

typedef PopUpPositionType = ScreenOffset?;

abstract class BaseMode<Self extends BaseMode<Self>> {
  const BaseMode();
  PopUpPositionType get popUpPosition;
  MapObject? get selection;

  Self withSelection(MapObject? selection);

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

  GestureResult<Self> onPointerDown(PointerDownGesture g, ScreenOffset p) =>
      GestureResult.none();
  GestureResult<Self> onDragStart(DragStartGesture g) => GestureResult.none();
  GestureResult<Self> onDragging(DraggingGesture g, ScreenOffset p) =>
      GestureResult.none();
  GestureResult<Self> onDragEnd(DragEndGesture g) => GestureResult.none();
  GestureResult<Self> onTap(TapGesture g) => GestureResult.none();

  Self? onCommandResult(CommandResult result) => switch (result) {
    SegmentDeleted(:final segmentId) => switch (selection) {
      MapSegment(:final id) when id == segmentId => withSelection(null),
      _ => null,
    },
    VertexRemoved(:final vertexId) => switch (selection) {
      MapVertex(:final id) when id == vertexId => withSelection(null),
      _ => null,
    },
    // TripSelected(:final trip) => withSelection(MapTripObject(trip.id)),
    // Listés explicitement plutôt que `_ => null` : l'ajout d'un nouveau
    // CommandResult cassera la compilation ici, au lieu d'être ignoré.
    SegmentCreated() ||
    SegmentSpliced() ||
    SegmentUpdated() ||
    SegmentCorrected() ||
    TripSelected() ||
    NoResult() => null,
  };
}
