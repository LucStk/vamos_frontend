import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/map_editor/commands/commands.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/map_state.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/map_mode.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/overlay_state.dart';
import 'package:vamos_cartographie/features/map_editor/events/ui/ui_events.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

import 'package:domain_core/domain_core.dart';
part 'map_ctrl_provider.g.dart';

@riverpod
class MapCtrl extends _$MapCtrl {
  @override
  MapState build(Id<Trip> tripId) {
    return const MapState(mode: Idle(), overlay: MapOverlayState.hidden());
  }

  void onUiEvent(MapUiEvent event) {
    // final commands = translator.translate(event, state);

    // for (final command in commands) {
    //   dispatch(command);
    // }
  }

  void dispatch(MapCommand command) {
    // final result = reducer(state.mode, command);

    // state = state.copyWith(mode: result.nextState);

    // for (final effect in result.effects) {
    //   effectRunner.run(effect);
    // }
  }
}
