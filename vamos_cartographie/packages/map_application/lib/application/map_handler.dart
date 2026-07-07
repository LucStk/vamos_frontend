import 'package:map_application/application/intent_resolver.dart';
import 'package:map_application/map_application.dart';

class MapHandler {
  final IntentResolver intentResolver;

  // Callback pour notifier le conteneur (Riverpod, Loader, Bloc, etc.)
  final void Function(MapState newState) onStateChanged;
  MapHandler({required this.intentResolver, required this.onStateChanged});

  // On passe le currentState à l'entrée de l'action UI
  void onUiEvent(MapInputEvent event, MapState currentState) {
    final result = reduce(currentState, event);
    onStateChanged(result.nextState);
    for (final intent in result.intents) {
      intentResolver.run(intent);
    }
  }
}
