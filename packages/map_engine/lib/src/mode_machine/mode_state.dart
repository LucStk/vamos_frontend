// mode_state.dart
import 'base_mode_model.dart';
import 'mode_decorator.dart';
import 'mode_context.dart';

final class ModeState<M extends BaseMode<M>> {
  const ModeState(
    this.mode, [
    this.decorator,
    this.context = ModeContext.empty,
  ]);

  final M mode;
  final ModeDecorator<M>? decorator;
  final ModeContext context;
}
