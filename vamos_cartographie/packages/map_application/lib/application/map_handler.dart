import 'package:map_application/application/effect_runner.dart';
import 'package:map_application/map_application.dart';

class MapHandler {
  final EffectRunner _effectRunner;

  // Callback pour notifier le conteneur (Riverpod, Loader, Bloc, etc.)
  final void Function(MapState newState) _onStateChanged;

  MapHandler({
    required EffectRunner effectRunner,
    required void Function(MapState newState) onStateChanged,
  }) : _effectRunner = effectRunner,
       _onStateChanged = onStateChanged;

  // On passe le currentState à l'entrée de l'action UI
  void onUiEvent(MapEvent event, MapState currentState) {
    // Prends l'event et la situation courante et la traduit en "intent"
    // (poser un vertex, poser le curseur sur une position, ..)
    final result = reduce(currentState.mode, event);
    final newState = currentState.copyWith(mode: result.nextState);
    _onStateChanged(newState);
    for (final intent in result.intents) {
      _effectRunner.run(effect);
    }
  }
}
