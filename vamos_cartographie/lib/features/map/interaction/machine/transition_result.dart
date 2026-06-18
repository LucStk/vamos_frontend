import 'map_effect.dart';
import 'map_mode.dart';

class TransitionResult {
  final MapMode nextState;
  final List<MapEffect> effects;

  const TransitionResult({required this.nextState, this.effects = const []});
}
