// overlays/popup_overlay.dart
import '../../domain/gestures/map_gesture.dart';
import '../../domain/space/offset_type.dart';
import '../mode.dart';
import 'overlay.dart';

abstract class ContextMenuOverlay<M extends Mode<M>> extends Overlay<M> {
  final ScreenOffset at;
  const ContextMenuOverlay(this.at);

  @override
  Interception intercept(MapGesture event, ScreenOffset offset) =>
      event is PointerDownGesture ? Interception.dismiss : Interception.pass;
}
