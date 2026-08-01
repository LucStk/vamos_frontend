import 'package:map_application/domain/map_state.dart';
import 'package:map_application/map_effects.dart';
import 'package:map_application/reducers/root_reducer.dart';
import 'events/events.dart';

class TransitionResult {
  final MapState nextState;
  final List<MapEffect> effects;

  const TransitionResult({required this.nextState, this.effects = const []});
}

mixin MapEditor implements MapEffectContext {
  MapState get state;
  set state(MapState value);

  @override
  Future<void> sendUiEvent(MapEvent event) async {
    final result = reduce(state, event);

    state = result.nextState;

    for (final effect in result.effects) {
      await effect.run(this);
    }
  }

  Future<void> sendEffect(MapEffect effect) async {
    await effect.run(this);
  }
}
