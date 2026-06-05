// features/map/presentation/providers/map_state_provider.dart
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'map_interaction_state.dart';
part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    required int tripId,
    @Default(MapInteraction.none()) MapInteraction interaction,
  }) = _MapState;

  const MapState._();
  factory MapState.fromTrip(Trip trip) {
    return MapState(tripId: trip.id);
  }
}
