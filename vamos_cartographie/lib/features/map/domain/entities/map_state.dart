// features/map/presentation/providers/map_state_provider.dart
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";
import 'map_interaction_state.dart';
import 'map_event.dart';
part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    required int tripId,
    @Default([]) List<Waypoint> waypoints,
    @Default([]) List<Segment> segments,
    @Default([]) List<Waypoint> savedWaypoints,
    @Default([]) List<Segment> savedSegments,
    @Default(MapInteraction.none()) MapInteraction interaction,
    MapEvent? event,
  }) = _MapState;

  const MapState._();
  bool get isDirty =>
      !const DeepCollectionEquality().equals(waypoints, savedWaypoints) ||
      !const DeepCollectionEquality().equals(segments, savedSegments);
  factory MapState.fromTrip(Trip trip) {
    return MapState(
      tripId: trip.id,
      savedWaypoints: List.unmodifiable(trip.waypoints),
      waypoints: List.unmodifiable(trip.waypoints),

      savedSegments: List.unmodifiable(trip.segments),
      segments: List.unmodifiable(trip.segments),
    );
  }
}
