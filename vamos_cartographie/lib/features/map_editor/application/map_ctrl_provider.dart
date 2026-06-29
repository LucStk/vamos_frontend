import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_editor/events/ui/ui_events.dart';

import '/features/map_editor/domain/domain.dart';

import 'package:vamos_cartographie/features/map_editor/intents/intents.dart';
import 'package:domain_core/domain_core.dart';
part 'map_ctrl_provider.g.dart';

@riverpod
class MapCtrl extends _$MapCtrl {
  @override
  MapState build(Id<Trip> tripId) {
    return const MapState(mode: Idle(), overlay: MapOverlayState.hidden());
  }

  void onUiEvent(MapUiEvent event) {
    final commands = translator.translate(event, state);

    // for (final command in commands) {
    //   dispatch(command);
    // }
  }

  void dispatch(MapIntents intent) {
    // final result = reducer(state.mode, command);

    // state = state.copyWith(mode: result.nextState);

    // for (final effect in result.effects) {
    //   effectRunner.run(effect);
    // }
  }
}
