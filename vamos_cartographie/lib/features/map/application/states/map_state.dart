// features/map/presentation/providers/map_state_provider.dart
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
  factory MapState.fromTrip(int tripId) {
    return MapState(tripId: tripId);
  }
}
