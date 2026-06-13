// features/map/presentation/providers/map_state_provider.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'map_interaction_state.dart';
part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    required Id<Trip> tripId,
    @Default(MapInteraction.none()) MapInteraction interaction,
  }) = _MapState;

  const MapState._();
  factory MapState.fromTrip(Id<Trip> tripId) {
    return MapState(tripId: tripId);
  }
}
