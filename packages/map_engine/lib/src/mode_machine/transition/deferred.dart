part of '../transition.dart';

final class DeferredTransition<M extends Mode<M>> extends Transition<M> {
  const DeferredTransition(this.build);
  final Transition<M>? Function(ModeState<M> state) build;

  @override
  ResolvedTransition<M>? resolve(ModeState<M> state) =>
      build(state)?.resolve(state);
}
