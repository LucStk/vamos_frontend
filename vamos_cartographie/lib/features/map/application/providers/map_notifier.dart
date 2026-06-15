// features/map/presentation/providers/map_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import "package:vamos_cartographie/features/map/application/states/states.dart";
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

part 'map_notifier.g.dart';

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  var _cursor = MapCursor();

  @override
  MapState build(Id<Trip> tripId) {
    return MapState.fromTrip(tripId);
  }

  MapCursor getCursor() {
    return _cursor;
  }

  void setCursorPosition(LatLng latLng) =>
      _cursor = _cursor.copyWith(latLng: latLng);

  void closeCursor() => _cursor = _cursor.copyWith(isOpen: false);
  void openCursor() => _cursor = _cursor.copyWith(isOpen: true);

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
