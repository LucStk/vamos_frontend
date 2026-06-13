// features/map/presentation/providers/map_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import "package:vamos_cartographie/features/map/application/states/states.dart";

part 'map_notifier.g.dart';

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  @override
  MapState build(int tripId) {
    return MapState.fromTrip(tripId);
  }

  void startWaypointCreation(LatLng position) {
    state = state.copyWith(
      interaction: MapInteraction.creatingWaypoint(position: position),
    );
  }

  void updatePendingWaypointPosition(LatLng position) {
    state.interaction.mapOrNull(
      creatingWaypoint: (interaction) {
        state = state.copyWith(
          interaction: interaction.copyWith(position: position),
        );
      },
    );
  }

  void cancelInteraction() {
    state = state.copyWith(interaction: const MapInteraction.none());
  }
}
