part of "map_objects.dart";

final class MapTrip extends MapObject {
  const MapTrip(this.id);
  final TripId id;

  // Identité = le trip, pas le droit d'édition.
  @override
  bool operator ==(Object other) => other is MapTrip && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
