import 'package:map_application/application/effect_runner.dart';
import 'package:map_application/application/translator/root_translator.dart';
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
  void onUiEvent(MapUiEvent event, MapState currentState) {
    print("event");
    final intents = translate(event, currentState);

    // On accumule les changements localement si plusieurs intents s'enchaînent
    MapState tempState = currentState;
    for (final intent in intents) {
      tempState = dispatch(intent, tempState);
    }
  }

  // Méthode interne qui applique un intent et retourne le nouvel état intermédiaire
  MapState dispatch(MapIntents intent, MapState currentState) {
    final result = reduce(currentState.mode, intent);

    final newState = currentState.copyWith(mode: result.nextState);

    // 1. On notifie le conteneur externe du changement d'état
    _onStateChanged(newState);

    // 2. On lance les effets de bord
    for (final effect in result.effects) {
      _effectRunner.run(effect);
    }

    return newState;
  }
}
