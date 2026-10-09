// mode_state.dart
import 'base_mode_model.dart';
import 'overlay/overlay.dart';
import 'mode_context.dart';

final class ModeState<M extends BaseMode<M>> {
  const ModeState(this.mode, [this.overlay, this.context = ModeContext.empty]);

  final M mode;
  final Overlay<M>? overlay;
  final ModeContext context;
}
