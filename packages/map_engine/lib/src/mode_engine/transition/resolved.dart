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
    List<SlotChange>? slots,
    Overlay? overlay,
    bool? closesOverlay,
  }) => ResolvedTransition(
    mode: mode,
    pending: pending,
    overlay: overlay ?? this.overlay,
    closesOverlay: closesOverlay ?? this.closesOverlay,
    slots: slots ?? this.slots,
  );
  // resolved.dart : `and` etc. restent, avec un type de retour plus précis
  @override
  ResolvedTransition and<T extends Object>(Slot<T> slot, T? value) =>
      _copy(slots: [...slots, (slot, value)]);

  @override
  ResolvedTransition _map(ResolvedTransition Function(ResolvedTransition) f) =>
      f(this);
  @override
  ResolvedTransition withOverlay(Overlay o) => _copy(overlay: o);

  @override
  ResolvedTransition closingOverlay() => _copy(closesOverlay: true);

  @override
  ResolvedTransition resolve(ModeState state) => this;
}
