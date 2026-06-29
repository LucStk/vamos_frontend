import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/commands/topology_provider.dart';
import 'package:vamos_cartographie/features/map_editor/application/effect_runner.dart';
import 'package:vamos_cartographie/features/map_editor/application/reducers/root_reducer.dart';

import 'package:vamos_cartographie/features/map_editor/intents/intents.dart';
import 'package:vamos_cartographie/features/map_editor/events/ui_events.dart';
import '/features/map_editor/domain/domain.dart';
import "translator/root_translator.dart";
import 'package:domain_core/domain_core.dart';
part 'map_ctrl_provider.g.dart';

@riverpod
class MapCtrl extends _$MapCtrl {
  late EffectRunner effectRunner;
  @override
  MapState build(Id<Trip> tripId) {
    effectRunner = EffectRunner(ref.read(topologyHandlerProvider(tripId)));
    return const MapState(mode: Idle(), overlay: MapOverlayState.hidden());
  }

  void onUiEvent(MapUiEvent event) {
    // Prend un Ui event, le transforme en intent et le
    // ..le passe au reducteur qui le transforme en TransitionResult
    // .. à transmettre à un handler
    final intents = translate(event, state);
    for (final intent in intents) {
      dispatch(intent);
    }
  }

  void dispatch(MapIntents intent) {
    final result = reduce(state.mode, intent);
    state = state.copyWith(mode: result.nextState);
    for (final effect in result.effects) {
      effectRunner.run(effect);
    }
  }
}
