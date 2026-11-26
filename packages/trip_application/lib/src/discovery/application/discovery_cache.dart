import 'dart:collection';

import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/discovery/domain/discovered_trip.dart';
import 'package:trip_application/src/discovery/domain/discovery_filters.dart';
import 'package:trip_application/src/discovery/domain/discovery_tile.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';
import 'package:trip_application/src/trip/domain/trip.dart';

/// Un voyage à dessiner : son tracé à l'échelle de la tuile qui l'a choisi.
final class VisibleTrip {
  const VisibleTrip({
    required this.id,
    required this.score,
    required this.preview,
    required this.daysCount,
    required this.lengthM,
    required this.mainMobility,
  });

  final TripId id;
  final double score;
  final List<List<LatLng>> preview;

  /// Les trois chiffres de la carte résumé, repris de la découverte : le titre,
  /// l'auteur et les photos, eux, sont dans les stores.
  final int daysCount;
  final double lengthM;
  final MobilityType? mainMobility;

  @override
  bool operator ==(Object other) =>
      other is VisibleTrip &&
      other.id == id &&
      other.score == score &&
      identical(other.preview, preview);

  @override
  int get hashCode => Object.hash(id, score, identityHashCode(preview));
}

/// Sélections déjà reçues, par (filtres, tuile). Rien n'est jeté quand la vue
/// change : un voyage masqué parce qu'il ne convient plus à l'échelle
/// réapparaît sans requête quand on revient sur la zone à cette échelle.
///
/// LRU : au-delà de [capacity] tuiles, les moins récemment vues partent.
/// Une tuile plus vieille que [ttl] reste affichable, mais est redemandée.
class TripDiscoveryCache {
  TripDiscoveryCache({
    this.capacity = 300,
    this.ttl = const Duration(minutes: 5),
  });

  final int capacity;
  final Duration ttl;

  // Ordre d'insertion = ordre d'usage : la première entrée est la plus ancienne.
  final _entries = LinkedHashMap<_Key, _Entry>();

  void put(
    TripDiscoveryFilters filters,
    DiscoveryTileResult result,
    DateTime now,
  ) {
    final key = (filters, result.tile);
    _entries.remove(key);
    _entries[key] = _Entry(
      fetchedAt: now,
      trips: [
        for (final t in result.trips)
          if (t.preview.any((part) => part.length >= 2))
            (
              trip: VisibleTrip(
                id: t.id,
                score: t.score,
                preview: t.preview,
                daysCount: t.daysCount,
                lengthM: t.lengthM,
                mainMobility: t.mainMobility,
              ),
              bounds: MapLatLngBounds.fromPoints(t.preview.expand((p) => p)),
            ),
      ],
    );
    while (_entries.length > capacity) {
      _entries.remove(_entries.keys.first);
    }
  }

  /// Oublie tout. À appeler quand ce que le serveur renverrait pour une tuile
  /// a changé sans que les filtres bougent : la clé ne distingue pas, par
  /// exemple, le nombre de voyages demandés par tuile.
  void clear() => _entries.clear();

  /// Tuiles de [tiles] absentes du cache, ou périmées.
  List<DiscoveryTile> missing(
    TripDiscoveryFilters filters,
    Iterable<DiscoveryTile> tiles,
    DateTime now,
  ) => [
    for (final tile in tiles)
      if (!_isFresh(_entries[(filters, tile)], now)) tile,
  ];

  bool _isFresh(_Entry? entry, DateTime now) =>
      entry != null && now.difference(entry.fetchedAt) < ttl;

  /// Les voyages à montrer pour une vue couverte par [tiles] (toutes du même
  /// niveau), les plus pertinents d'abord, [maxTrips] au plus.
  ///
  /// Une tuile pas encore reçue est remplacée, en attendant, par ce que le
  /// cache sait de la même zone à une autre échelle : une tuile ancêtre (vue
  /// plus large), sinon ses tuiles filles. Ces voyages de secours ne sont
  /// gardés que s'ils touchent [viewport]. Sans cela, la carte se viderait à
  /// chaque zoom le temps de la requête.
  List<VisibleTrip> visible({
    required TripDiscoveryFilters filters,
    required List<DiscoveryTile> tiles,
    required MapLatLngBounds viewport,
    int maxTrips = 40,
    int maxAncestors = 3,
  }) {
    final best = <TripId, VisibleTrip>{};

    void offer(_Entry entry, {required bool exact}) {
      for (final (:trip, :bounds) in entry.trips) {
        if (!exact && !_intersects(bounds, viewport)) continue;
        final current = best[trip.id];
        if (current == null || trip.score > current.score) best[trip.id] = trip;
      }
    }

    for (final tile in tiles) {
      final exact = _use(filters, tile);
      if (exact != null) {
        offer(exact, exact: true);
        continue;
      }
      final fallback = _ancestor(filters, tile, maxAncestors);
      if (fallback != null) {
        offer(fallback, exact: false);
        continue;
      }
      for (final child in tile.children) {
        final entry = _use(filters, child);
        if (entry != null) offer(entry, exact: false);
      }
    }

    final trips = best.values.toList()
      ..sort((a, b) => b.score.compareTo(a.score));
    return trips.take(maxTrips).toList();
  }

  _Entry? _ancestor(TripDiscoveryFilters filters, DiscoveryTile tile, int max) {
    var current = tile.parent;
    for (var i = 0; i < max && current != null; i++) {
      final entry = _use(filters, current);
      if (entry != null) return entry;
      current = current.parent;
    }
    return null;
  }

  _Entry? _use(TripDiscoveryFilters filters, DiscoveryTile tile) {
    final key = (filters, tile);
    final entry = _entries.remove(key);
    if (entry != null) _entries[key] = entry; // la plus récemment vue
    return entry;
  }

  static bool _intersects(MapLatLngBounds a, MapLatLngBounds b) =>
      a.west <= b.east &&
      b.west <= a.east &&
      a.south <= b.north &&
      b.south <= a.north;
}

typedef _Key = (TripDiscoveryFilters, DiscoveryTile);

final class _Entry {
  _Entry({required this.fetchedAt, required this.trips});

  final DateTime fetchedAt;
  final List<({VisibleTrip trip, MapLatLngBounds bounds})> trips;
}
