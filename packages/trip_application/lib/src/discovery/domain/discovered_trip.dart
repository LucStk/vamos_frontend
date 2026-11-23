import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/discovery/domain/discovery_tile.dart';
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
  });

  final TripSummary summary;
  final UserProfile owner;

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
