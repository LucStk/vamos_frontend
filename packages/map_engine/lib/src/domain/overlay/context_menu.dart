import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/overlay/menu_anchor.dart';
import 'package:map_engine/src/mode_machine/app_mode.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';

abstract class ContextMenuOverlay<M extends Mode<M>> extends Overlay<M> {
  const ContextMenuOverlay(this.anchor);
  final MenuAnchor anchor;

  @override
  Interception intercept(MapGesture event) =>
      event is PressGesture ? Interception.dismiss : Interception.pass;
}

abstract class MapObjectMenu<T extends MapObject>
    extends ContextMenuOverlay<AppMode> {
  final T object;
  MapObjectMenu(this.object) : super(ObjectAnchor(object));
}
