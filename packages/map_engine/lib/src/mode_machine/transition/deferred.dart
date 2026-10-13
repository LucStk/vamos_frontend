part of '../transition.dart';

final class DeferredTransition<M extends Mode<M>> extends Transition<M> {
  const DeferredTransition(this.build);
  final Transition<M>? Function(ModeState<M> state) build;
  // deferred.dart
  @override
  DeferredTransition<M> _map(
    ResolvedTransition<M> Function(ResolvedTransition<M>) f,
  ) => DeferredTransition((st) {
    final r = resolve(st);
    return r == null ? null : f(r);
  });
  @override
  ResolvedTransition<M>? resolve(ModeState<M> state) =>
      build(state)?.resolve(state);
}
