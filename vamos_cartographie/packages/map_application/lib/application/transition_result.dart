import 'package:map_application/map_application.dart';

class TransitionResult {
  final MapMode nextState;
  final List<MapIntents> intents;

  const TransitionResult({required this.nextState, this.intents = const []});
}
