import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/discovery/domain/discovery_tile.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:trip_application/src/trip_bundle.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

/// Un voyage choisi par le serveur pour une tuile.
final class DiscoveredTrip {
  const DiscoveredTrip({
    required this.summary,
    required this.owner,
    required this.score,
    required this.preview,
    required this.daysCount,
    required this.lengthM,
    required this.mainMobility,
  });

  final TripSummary summary;
  final UserProfile owner;

  /// Numéro du dernier jour : un voyage sans halte dure 1 jour.
  final int daysCount;

  /// Longueur géodésique de la route entière, en mètres (et non de l'aperçu,
  /// qui est découpé autour de la tuile).
  final double lengthM;

  /// Modalité la plus longue sur la route ; `null` si le voyage n'a aucun
  /// calque de mobilité.
  final MobilityType? mainMobility;

  /// Pertinence à l'échelle de la tuile ; comparable d'une tuile à l'autre.
  final double score;

  /// Tracé simplifié pour cette échelle, découpé autour de la tuile.
  final List<List<LatLng>> preview;

  TripId get id => summary.trip.id;
}

/// Réponse du serveur pour une tuile.
final class DiscoveryTileResult {
  const DiscoveryTileResult({required this.tile, required this.trips});

  final DiscoveryTile tile;

  /// Du plus au moins pertinent.
  final List<DiscoveredTrip> trips;
}
