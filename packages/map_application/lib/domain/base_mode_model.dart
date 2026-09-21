import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/gesture_result_model.dart';
import 'package:map_engine/controller/controller.dart';
import 'package:map_engine/visual/domain/map_objects.dart';

abstract class BaseMode<Self extends BaseMode<Self>> {
  const BaseMode();

  MapObject? get selection;
  Self withSelection(MapObject? element);
  ModeGestureHandler<Self> get handler;
}

abstract interface class ModeGestureHandler<M extends BaseMode<M>> {
  GestureResult<M> onPointerDown(PointerDownGesture g, LatLng p);
  GestureResult<M> onDragStart(DragStartGesture g);
  GestureResult<M> onDragging(DraggingGesture g, LatLng p);
  GestureResult<M> onDragEnd(DragEndGesture g);
  GestureResult<M> onTap(TapGesture g);
}

abstract base class NoopGestureHandler<M extends BaseMode<M>>
    implements ModeGestureHandler<M> {
  const NoopGestureHandler();

  /// Le mode auquel ce handler est lié
  M get mode;

  @override
  GestureResult<M> onPointerDown(PointerDownGesture g, LatLng p) =>
      GestureResult.none();
  @override
  GestureResult<M> onDragStart(DragStartGesture g) => GestureResult.none();
  @override
  GestureResult<M> onDragging(DraggingGesture g, LatLng p) =>
      GestureResult.none();
  @override
  GestureResult<M> onDragEnd(DragEndGesture g) => GestureResult.none();
  @override
  GestureResult<M> onTap(TapGesture g) => GestureResult.none();
}

final class SelectionGestureHandler<M extends BaseMode<M>>
    extends NoopGestureHandler<M> {
  const SelectionGestureHandler(this.mode);

  @override
  final M mode;

  @override
  GestureResult<M> onTap(TapGesture g) =>
      GestureResult(mode: mode.withSelection(g.element));
}
