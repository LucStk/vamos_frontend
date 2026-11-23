import 'package:trip_application/src/route/domain/mobility_types.dart';

/// Ce que l'utilisateur veut voir sur la carte. `null` : pas de contrainte.
///
/// Fait partie de la clé de cache : changer de filtre ne mélange jamais les
/// résultats, et revenir à un filtre précédent réutilise ses tuiles.
final class TripDiscoveryFilters {
  const TripDiscoveryFilters({
    this.minDays,
    this.maxDays,
    this.mobilities = const {},
    this.minLengthKm,
    this.maxLengthKm,
  });

  static const none = TripDiscoveryFilters();

  final int? minDays;
  final int? maxDays;

  /// Modalité principale (la plus longue sur la route) parmi celles-ci.
  /// Vide : toutes.
  final Set<MobilityType> mobilities;
  final double? minLengthKm;
  final double? maxLengthKm;

  @override
  bool operator ==(Object other) =>
      other is TripDiscoveryFilters &&
      other.minDays == minDays &&
      other.maxDays == maxDays &&
      other.mobilities.length == mobilities.length &&
      other.mobilities.containsAll(mobilities) &&
      other.minLengthKm == minLengthKm &&
      other.maxLengthKm == maxLengthKm;

  @override
  int get hashCode => Object.hash(
    minDays,
    maxDays,
    Object.hashAllUnordered(mobilities),
    minLengthKm,
    maxLengthKm,
  );
}
