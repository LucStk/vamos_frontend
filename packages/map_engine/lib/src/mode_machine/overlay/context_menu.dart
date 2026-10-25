import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/overlay.dart';
import 'package:map_engine/src/mode_machine/overlay/menu_anchor.dart';

abstract class ContextMenuOverlay<M extends Mode<M>> extends Overlay<M> {
  const ContextMenuOverlay();
  MenuAnchor get anchor;

  @override
  Interception intercept(MapGesture event) =>
      event is PressGesture ? Interception.dismiss : Interception.pass;

  @override
  bool? visibleAfter(MapGesture event) => switch (event) {
    DragStartGesture() || DragUpdateGesture() => false,
    DragEndGesture() || DragCancelGesture() => true,
    _ => null,
  };
}

abstract class MapObjectMenu<T extends MapObject>
    extends ContextMenuOverlay<AppMode> {
  final T object;
  MapObjectMenu(this.object);
}
