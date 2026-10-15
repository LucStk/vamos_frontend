part of "map_objects.dart";

final class MapTrip extends MapObject {
  const MapTrip(this.id, {this.isOwned = false});
  final TripId id;

  /// Calculé par le provider de la scène (ownerId == currentUserId).
  final bool isOwned;

  // Identité = le trip, pas le droit d'édition.
  @override
  bool operator ==(Object other) => other is MapTrip && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
