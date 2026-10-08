// decorators/popup_decorator.dart
import '../domain/gestures/map_gesture.dart';
import '../domain/space/offset_type.dart';
import 'base_mode_model.dart';
import 'mode_decorator.dart';

abstract class ContextMenuDecorator<M extends BaseMode<M>>
    extends ModeDecorator<M> {
  final ScreenOffset at;
  const ContextMenuDecorator(this.at);

  @override
  Interception intercept(MapGesture event, ScreenOffset offset) =>
      event is PointerDownGesture ? Interception.dismiss : Interception.pass;
}
