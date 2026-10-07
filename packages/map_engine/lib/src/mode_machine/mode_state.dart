// mode_state.dart
import 'base_mode_model.dart';
import 'mode_decorator.dart';

final class ModeState<M extends BaseMode<M>> {
  const ModeState(this.mode, [this.decorator]);
  final M mode;
  final ModeDecorator<M>? decorator;
}
