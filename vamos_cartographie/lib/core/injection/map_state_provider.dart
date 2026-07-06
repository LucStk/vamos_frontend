import 'package:map_application/application/intent_resolver.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/commands.dart';

part 'map_state_provider.g.dart';

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  late final MapHandler _handler;
  @override
  MapState build(TripId tripId) {
    // 2. On passe le tripId ICI en paramètre de build()

    // Tu peux maintenant utiliser tripId directement dans ton build
    final topologyHandler = ref.watch(topologyHandlerProvider(tripId));
    final resolver = IntentResolver(topologyHandler);

    _handler = MapHandler(
      intentResolver: resolver,
      onStateChanged: (newState) => state = newState,
    );

    return const MapState();
  }

  void sendUiEvent(MapEvent event) {
    _handler.onUiEvent(event, state);
  }

  void sendIntent(MapIntents intent) {
    _handler.intentResolver.run(intent);
  }
}
