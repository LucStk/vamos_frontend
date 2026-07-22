import 'package:map_application/application/intent_resolver.dart';
import 'package:map_application/application/map_state.dart';
import 'package:map_application/application/reducers/root_reducer.dart';
import 'package:map_application/input_events/input_events.dart';
import 'package:map_application/intents/intents.dart';

mixin MapEditor {
  MapState get state;
  set state(MapState value);

  IntentResolver get intentResolver;

  void sendUiEvent(MapInputEvent event) {
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
