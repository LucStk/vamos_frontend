import 'package:vamos_cartographie/features/map_ui/domain/effects/map_effect.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/map_mode.dart';

class TransitionResult {
  final MapMode nextState;
  final List<MapEffect> effects;

  const TransitionResult({required this.nextState, this.effects = const []});
}
