import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:test/test.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

final _owner = UserProfile(id: UserId('owner'), profileName: 'luc', bio: '');

DiscoveredTrip _trip(String id, double score, List<LatLng> line) =>
    DiscoveredTrip(
      summary: TripSummary(
        trip: Trip(id: TripId(id), ownerId: _owner.id),
        storedFiles: const <StoredFileFields>[],
      ),
      owner: _owner,
      score: score,
      preview: [line],
      // Les chiffres de la carte résumé ne jouent aucun rôle ici : ces tests
      // portent sur les tuiles, le cache et la sélection.
      daysCount: 1,
      lengthM: 0,
      mainMobility: null,
    );

DiscoveryTileResult _result(DiscoveryTile tile, List<DiscoveredTrip> trips) =>
    DiscoveryTileResult(tile: tile, trips: trips);

List<String> _ids(List<VisibleTrip> trips) =>
    [for (final t in trips) t.id.value.toString()];

// Vue d'environ 10 km autour de Rennes.
const _rennes = MapLatLngBounds(
  north: 48.15,
  south: 48.07,
  east: -1.62,
  west: -1.74,
);
const _filters = TripDiscoveryFilters.none;
final _now = DateTime(2026, 11, 23, 12);

void main() {
  group('DiscoveryTile', () {
    test('une tuile fait 1 à 2 fois le plus grand côté de l\'écran', () {
      // 1024 px = 4 tuiles de 256 px : le niveau est zoom - 2.
      expect(DiscoveryTile.levelFor(zoom: 6.0, viewportMaxPx: 1024), 4);
      expect(DiscoveryTile.levelFor(zoom: 6.9, viewportMaxPx: 1024), 4);
      expect(DiscoveryTile.levelFor(zoom: 7.0, viewportMaxPx: 1024), 5);
    });

    test('le niveau courant est gardé près d\'une frontière', () {
      expect(
        DiscoveryTile.levelFor(zoom: 7.2, viewportMaxPx: 1024, current: 4),
        4,
      );
      expect(
        DiscoveryTile.levelFor(zoom: 7.4, viewportMaxPx: 1024, current: 4),
        5,
      );
      expect(
        DiscoveryTile.levelFor(zoom: 5.8, viewportMaxPx: 1024, current: 4),
        4,
      );
    });

    test('tuiles couvrant une vue', () {
      // Rennes au niveau 12 : une ou deux tuiles par axe.
      final tiles = DiscoveryTile.covering(_rennes, 12);
      expect(tiles, isNotEmpty);
      expect(tiles.length, lessThanOrEqualTo(4));
      expect(tiles.every((t) => t.z == 12), isTrue);

      // Vue à cheval sur l'antiméridien.
      final pacific = DiscoveryTile.covering(
        const MapLatLngBounds(north: 10, south: -10, east: -170, west: 170),
        2,
      );
      expect(pacific.map((t) => t.x).toSet(), {3, 0});
    });

    test('parent et enfants', () {
      const tile = DiscoveryTile(5, 15, 10);
      expect(tile.parent, const DiscoveryTile(4, 7, 5));
      expect(tile.children.map((c) => c.parent).toSet(), {tile});
      expect(const DiscoveryTile(0, 0, 0).parent, isNull);
    });
  });

  group('TripDiscoveryCache', () {
    final level = 12;
    late List<DiscoveryTile> tiles;
    late TripDiscoveryCache cache;

    final boucle = [const LatLng(48.10, -1.70), const LatLng(48.12, -1.66)];
    final ailleurs = [const LatLng(43.30, 5.37), const LatLng(43.31, 5.40)];

    setUp(() {
      tiles = DiscoveryTile.covering(_rennes, level);
      cache = TripDiscoveryCache();
    });

    test('tuiles manquantes, puis périmées', () {
      expect(cache.missing(_filters, tiles, _now), tiles);

      for (final t in tiles) {
        cache.put(_filters, _result(t, []), _now);
      }
      expect(cache.missing(_filters, tiles, _now), isEmpty);
      expect(
        cache.missing(_filters, tiles, _now.add(const Duration(minutes: 6))),
        tiles,
      );
      // Les filtres font partie de la clé.
      expect(
        cache.missing(const TripDiscoveryFilters(maxDays: 3), tiles, _now),
        tiles,
      );
    });

    test('union des tuiles, un voyage une fois avec son meilleur score', () {
      cache.put(_filters, _result(tiles.first, [_trip('a', 0.4, boucle)]), _now);
      if (tiles.length > 1) {
        cache.put(
          _filters,
          _result(tiles.last, [_trip('a', 0.9, boucle), _trip('b', 0.5, boucle)]),
          _now,
        );
      }

      final visible = cache.visible(
        filters: _filters,
        tiles: tiles,
        viewport: _rennes,
      );

      expect(_ids(visible).toSet().length, visible.length);
      expect(visible.first.id, TripId('a'));
      if (tiles.length > 1) expect(visible.first.score, 0.9);
    });

    test('un voyage masqué réapparaît quand on revient à son échelle', () {
      cache.put(_filters, _result(tiles.first, [_trip('local', 1, boucle)]), _now);

      // Dézoom : d'autres tuiles, le voyage local n'en fait pas partie.
      final large = DiscoveryTile.covering(_rennes, level - 4);
      for (final t in large) {
        cache.put(_filters, _result(t, [_trip('traversee', 1, boucle)]), _now);
      }
      expect(
        _ids(cache.visible(filters: _filters, tiles: large, viewport: _rennes)),
        ['traversee'],
      );

      // Retour au zoom de départ : sans requête, le voyage local revient.
      expect(
        _ids(cache.visible(filters: _filters, tiles: [tiles.first], viewport: _rennes)),
        ['local'],
      );
    });

    test('en attendant une tuile, l\'ancêtre en cache sert de secours', () {
      final ancestor = tiles.first.parent!.parent!;
      cache.put(
        _filters,
        _result(ancestor, [_trip('proche', 0.5, boucle), _trip('loin', 0.9, ailleurs)]),
        _now,
      );

      final visible = cache.visible(
        filters: _filters,
        tiles: tiles,
        viewport: _rennes,
      );

      // `loin` est dans la tuile ancêtre mais hors de la vue.
      expect(_ids(visible), ['proche']);
    });

    test('à défaut d\'ancêtre, les tuiles filles servent de secours', () {
      final child = tiles.first.children.first;
      cache.put(_filters, _result(child, [_trip('detail', 0.5, boucle)]), _now);

      expect(
        _ids(cache.visible(filters: _filters, tiles: [tiles.first], viewport: _rennes)),
        ['detail'],
      );
    });

    test('nombre maximal de voyages, par score', () {
      cache.put(
        _filters,
        _result(tiles.first, [
          for (var i = 0; i < 10; i++) _trip('t$i', i / 10, boucle),
        ]),
        _now,
      );

      final visible = cache.visible(
        filters: _filters,
        tiles: [tiles.first],
        viewport: _rennes,
        maxTrips: 3,
      );
      expect(_ids(visible), ['t9', 't8', 't7']);
    });

    test('LRU : les tuiles les moins récemment vues partent', () {
      final small = TripDiscoveryCache(capacity: 2);
      const a = DiscoveryTile(3, 0, 0);
      const b = DiscoveryTile(3, 1, 0);
      const c = DiscoveryTile(3, 2, 0);
      small.put(_filters, _result(a, []), _now);
      small.put(_filters, _result(b, []), _now);
      // Utiliser `a` la rend plus récente que `b`.
      small.visible(filters: _filters, tiles: [a], viewport: _rennes);
      small.put(_filters, _result(c, []), _now);

      expect(small.missing(_filters, [a, b, c], _now), [b]);
    });
  });
}
