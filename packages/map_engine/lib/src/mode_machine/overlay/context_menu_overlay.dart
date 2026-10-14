import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/mode_machine/mode.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';

abstract class ContextMenuOverlay<M extends Mode<M>> extends Overlay<M> {
  final ScreenOffset at;
  const ContextMenuOverlay(this.at);

  @override
  Interception intercept(MapGesture event) =>
      event is PressGesture ? Interception.dismiss : Interception.pass;
}
