import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/map/application/commands/commands.dart';
import 'package:vamos_cartographie/features/map/domain/state/map_state.dart';
import 'package:vamos_cartographie/features/map/domain/state/map_mode.dart';
import 'package:vamos_cartographie/features/map/domain/state/overlay_state.dart';
import 'package:vamos_cartographie/features/map/application/events/ui/ui_events.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

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
