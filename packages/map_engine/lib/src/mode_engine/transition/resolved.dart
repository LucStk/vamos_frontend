part of '../transition.dart';

final class ResolvedTransition extends Transition {
  const ResolvedTransition({
    this.mode,
    this.pending,
    this.overlay,
    this.closesOverlay = false,
    this.slots = const [],
  });

  final Mode? mode;
  final PendingRun? pending;
  final Overlay? overlay; // ouvre / remplace
  final bool closesOverlay; // ferme explicitement
  final List<SlotChange> slots;

  /// Règle unique : une transition qui change de mode ferme l'overlay ;
  /// sinon elle le laisse tel quel, sauf demande explicite.
  Overlay? overlayAfter(Overlay? current) =>
      overlay ?? (closesOverlay || mode != null ? null : current);

  ResolvedTransition _copy({
    Mode? mode,
    PendingRun? pending,
    List<SlotChange>? slots,
    Overlay? overlay,
    bool? closesOverlay,
  }) => ResolvedTransition(
    mode: mode ?? this.mode,
    pending: pending ?? this.pending,
    overlay: overlay ?? this.overlay,
    closesOverlay: closesOverlay ?? this.closesOverlay,
    slots: slots ?? this.slots,
  );

  // Les combinateurs restent, avec un type de retour plus précis.

  @override
  ResolvedTransition and<T extends Object>(Slot<T> slot, T? value) =>
      _copy(slots: [...slots, (slot, value)]);

  @override
  ResolvedTransition clearSlot<T extends Object>(Slot<T> slot) =>
      _copy(slots: [...slots, (slot, null)]);
  @override
  ResolvedTransition withOverlay(Overlay o) => _copy(overlay: o);

  @override
  ResolvedTransition closingOverlay() => _copy(closesOverlay: true);

  @override
  ResolvedTransition switchingTo(Mode m) => _copy(mode: m);

  @override
  ResolvedTransition running<R extends Object>(
    Command<R> command, {
    Transition? Function(ModeState current, R result)? then,
  }) {
    assert(pending == null, 'Une transition ne porte qu\'un seul effet');
    return _copy(pending: PendingRun.of(command, then));
  }

  @override
  ResolvedTransition _map(ResolvedTransition Function(ResolvedTransition) f) =>
      f(this);

  @override
  ResolvedTransition resolve(ModeState state) => this;
}
