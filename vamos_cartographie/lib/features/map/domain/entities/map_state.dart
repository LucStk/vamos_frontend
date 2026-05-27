// features/map/presentation/providers/map_state_provider.dart
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";
part 'map_state.freezed.dart';
// enum MapMode { observer, editRoute, addPoint }

@freezed
class MapState with _$MapState {
  const factory MapState({
    required Trip currentTrip,
    @Default(false) bool isDirty,
    @Default([]) List<Waypoint> waypointsSnapshot,
    @Default([]) List<Segment> segmentsSnapshot,
    // AddPoint, editRoute, etc. (Tu pourras les décommenter facilement)
    // @Default(MapMode.observer) MapMode mode,
    // @Default(0) int waypointsCountBeforeAdd,
  }) = _MapState;

  // Pour ajouter un constructeur personnalisé (comme ton .fromTrip)
  // ou des getters, Freezed impose d'ajouter ce constructeur privé :
  const MapState._();

  factory MapState.fromTrip(Trip trip) {
    return MapState(
      currentTrip: trip,
      waypointsSnapshot: List.unmodifiable(trip.waypoints),
      segmentsSnapshot: List.unmodifiable(trip.segments),
    );
  }
}
