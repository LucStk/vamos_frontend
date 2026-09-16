import 'package:map_engine/pointer_events_resolver/pointer_gesture_action.dart';

abstract class MapEffect {
  const MapEffect();
}

abstract interface class GestureActionResolver {
  void resolve(PointerGestureAction? action);
}
