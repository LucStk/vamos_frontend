// mode_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/mode.dart';
import 'package:map_engine/src/mode_engine/overlay.dart';
import 'package:map_engine/src/mode_engine/slots.dart';
import 'package:map_engine/src/mode_engine/transition.dart';

part 'mode_state.freezed.dart';

@freezed
abstract class ModeState with _$ModeState {
  const ModeState._();

  const factory ModeState({
    required Mode mode,
    Overlay? overlay,
    @Default(Slots.empty) Slots slots,
    @Default(true) bool overlayVisible,
  }) = _ModeState;

  ModeState withOverlayVisible(bool v) =>
      v == overlayVisible ? this : copyWith(overlayVisible: v);

  ModeState withoutOverlay() =>
      overlay == null ? this : copyWith(overlay: null, overlayVisible: true);

  /// État obtenu en appliquant [t]. Pur : pas d'effet, pas de setState.
  /// Renvoie `this` si rien ne change.
  ModeState after(ResolvedTransition t) {
    final nextMode = t.mode ?? mode;
    final entered = nextMode != mode ? slots.afterTransition(nextMode) : slots;
    final nextSlots = entered.withSlots(t.slots);
    final nextOverlay = t.overlayAfter(overlay);

    if (identical(nextMode, mode) &&
        identical(nextOverlay, overlay) &&
        nextSlots == slots) {
      return this;
    }
    return copyWith(
      mode: nextMode,
      overlay: nextOverlay,
      slots: nextSlots,
      // Un nouvel overlay (ou son retrait) repart visible.
      overlayVisible: identical(nextOverlay, overlay) ? overlayVisible : true,
    );
  }

  /// Le mode courant s'il est de type [S], sinon null.
  S? modeAs<S extends Mode>() => mode is S ? mode as S : null;
}
