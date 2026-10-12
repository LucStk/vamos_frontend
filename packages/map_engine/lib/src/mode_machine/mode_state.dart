// mode_state.dart
import 'mode.dart';
import 'overlay/overlay.dart';
import 'slots.dart';
import 'transition.dart';

final class ModeState<M extends Mode<M>> {
  const ModeState(this.mode, [this.overlay, this.slots = Slots.empty]);

  final M mode;
  final Overlay<M>? overlay;
  final Slots slots;

  ModeState<M> withoutOverlay() =>
      overlay == null ? this : ModeState(mode, null, slots);

  /// État obtenu en appliquant [t]. Pur : pas d'effet, pas de setState.
  /// Renvoie `this` si rien ne change (comme `Modeslots.withSlot`).
  ModeState<M> after(ResolvedTransition<M> t) {
    final nextMode = t.mode ?? mode;
    final entered = nextMode != mode ? slots.afterTransition(nextMode) : slots;
    final nextslots = entered.withSlots(t.slots);
    final nextOverlay = t.overlayAfter(overlay);

    if (identical(nextMode, mode) &&
        identical(nextOverlay, overlay) &&
        nextslots == slots) {
      return this;
    }
    return ModeState(nextMode, nextOverlay, nextslots);
  }
}
