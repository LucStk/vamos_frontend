import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/overlay.dart';

abstract class ContextMenuOverlay<M extends Mode<M>> extends Overlay<M> {
  const ContextMenuOverlay();

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

class MapGeoMenu extends ContextMenuOverlay<AppMode> {
  MapGeoMenu(this.position);
  final WorldOffset position;
}

class MapObjectMenu extends ContextMenuOverlay<AppMode> {
  MapObjectMenu(this.hit);
  final MapHit hit;
}
