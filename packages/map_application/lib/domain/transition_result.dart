import 'package:map_application/domain/map_state.dart';
import 'package:map_application/map_application.dart';

class TransitionResult {
  final MapState nextState;
  final List<MapIntents> intents;

  const TransitionResult({required this.nextState, this.intents = const []});
}
