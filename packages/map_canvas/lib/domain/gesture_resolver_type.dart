import 'package:map_engine/map_engine.dart';

abstract class MapEffect {
  const MapEffect();
}

abstract interface class GestureActionResolver {
  void resolve(PointerGestureAction? action);
}
