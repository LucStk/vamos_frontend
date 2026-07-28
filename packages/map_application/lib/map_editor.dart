import 'package:map_application/domain/map_state.dart';
import 'package:map_application/intent_resolver.dart';
import 'package:map_application/intents/intents.dart';
import 'package:map_application/reducers/root_reducer.dart';
import 'events/events.dart';

mixin MapEditor {
  MapState get state;
  set state(MapState value);

  IntentResolver get intentResolver;

  void sendUiEvent(MapEvent event) {
    final result = reduce(state, event);
    state = result.nextState;
    for (final intent in result.intents) {
      intentResolver.run(intent);
    }
  }

  void sendIntent(MapIntents intent) {
    intentResolver.run(intent);
  }
}
