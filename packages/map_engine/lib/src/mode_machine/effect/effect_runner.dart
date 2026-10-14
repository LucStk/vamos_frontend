// effect/effect_runner.dart
import 'handler_registry.dart';
import 'effect_queue.dart';
import '../mode.dart';
import '../mode_state.dart';
import '../transition.dart';
import 'pending_run.dart';

abstract interface class ModeDriver<M extends Mode<M>> {
  ModeState<M> get state;
  void apply(Transition<M>? transition);
}

final class EffectRunner<M extends Mode<M>> {
  EffectRunner({
    required this.registry,
    required this.queue,
    required this.driver,
  });
  final HandlerRegistry registry;
  final EffectQueue queue;
  final ModeDriver<M> driver;

  void schedule(PendingRun<M> p) => queue.add(() async {
    try {
      final t = await p.execute(registry, () => driver.state);
      driver.apply(t);
    } catch (e, st) {
      print('effet en échec : $e\n$st');
      rethrow;
    }
  });
}
