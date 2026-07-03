import 'package:map_application/application/effect_runner.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/commands.dart';
import 'package:vamos_cartographie/infrastructure/core/erreur_handler.dart';

part 'map_state_provider.g.dart';

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  late final MapHandler _handler;
  @override
  MapState build(TripId tripId) {
    // 2. On passe le tripId ICI en paramètre de build()

    // Tu peux maintenant utiliser tripId directement dans ton build
    final topologyHandler = ref.watch(topologyHandlerProvider(tripId));
    final errorLogger = ErrorHandler.instance;
    final runner = EffectRunner(topologyHandler, errorLogger);

    _handler = MapHandler(
      effectRunner: runner,
      onStateChanged: (newState) => state = newState,
    );

    return const MapState();
  }

  void sendUiEvent(MapUiEvent event) {
    _handler.onUiEvent(event, state);
  }

  void sendIntent(MapIntents intent) {
    _handler.dispatch(intent, state);
  }
}
