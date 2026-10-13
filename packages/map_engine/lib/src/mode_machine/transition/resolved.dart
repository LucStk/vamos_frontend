part of '../transition.dart';

final class ResolvedTransition<M extends Mode<M>> extends Transition<M> {
  const ResolvedTransition({
    this.mode,
    this.pending,
    this.overlay,
    this.closesOverlay = false,
    this.slots = const [],
  });

  final M? mode;
  final PendingRun<M>? pending;
  final Overlay<M>? overlay; // ouvre / remplace
  final bool closesOverlay; // ferme explicitement
  final List<SlotChange> slots;

  /// Règle unique : une transition qui change de mode ferme l'overlay ;
  /// sinon elle le laisse tel quel, sauf demande explicite.
  Overlay<M>? overlayAfter(Overlay<M>? current) =>
      overlay ?? (closesOverlay || mode != null ? null : current);

  ResolvedTransition<M> _copy({
    List<SlotChange>? slots,
    Overlay<M>? overlay,
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
  ResolvedTransition<M> and<T extends Object>(Slot<T> slot, T? value) =>
      _copy(slots: [...slots, (slot, value)]);

  @override
  ResolvedTransition<M> _map(
    ResolvedTransition<M> Function(ResolvedTransition<M>) f,
  ) => f(this);
  @override
  ResolvedTransition<M> withOverlay(Overlay<M> o) => _copy(overlay: o);

  @override
  ResolvedTransition<M> closingOverlay() => _copy(closesOverlay: true);

  @override
  ResolvedTransition<M> resolve(ModeState<M> state) => this;
}
