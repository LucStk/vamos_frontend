part of '../transition.dart';

final class DeferredTransition extends Transition {
  const DeferredTransition(this.build);
  final Transition? Function(ModeState state) build;
  // deferred.dart
  @override
  DeferredTransition _map(ResolvedTransition Function(ResolvedTransition) f) =>
      DeferredTransition((st) {
        final r = resolve(st);
        return r == null ? null : f(r);
      });
  @override
  ResolvedTransition? resolve(ModeState state) => build(state)?.resolve(state);
}
