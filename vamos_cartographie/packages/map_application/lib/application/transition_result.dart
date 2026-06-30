import '/effects/map_effect.dart';

import '/domain/domain.dart';

class TransitionResult {
  final MapMode nextState;
  final List<MapEffect> effects;

  const TransitionResult({required this.nextState, this.effects = const []});
}
