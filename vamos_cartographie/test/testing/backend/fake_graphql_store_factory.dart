import 'dart:math';

import 'fake_graphql_seed.dart';
import 'fake_graphql_store.dart';

/// Fabrique de [FakeGraphQLStore] préconfigurés.
///
/// ```dart
/// // Store vide.
/// final store = FakeGraphQLStoreFactory.empty();
///
/// // Store pré-peuplé avec le seed par défaut.
/// final store = FakeGraphQLStoreFactory.withDefaultSeed();
///
/// // Store pré-peuplé avec un seed personnalisé.
/// final store = FakeGraphQLStoreFactory.fromSeed(mySeed);
/// ```
abstract final class FakeGraphQLStoreFactory {
  /// Retourne un [FakeGraphQLStore] vide. Compteurs d'IDs à 1.
  static FakeGraphQLStore empty() => FakeGraphQLStore();

  /// Retourne un [FakeGraphQLStore] pré-peuplé avec [kDefaultSeed].
  static FakeGraphQLStore withDefaultSeed() => fromSeed(kDefaultSeed);

  /// Retourne un [FakeGraphQLStore] pré-peuplé à partir du [seed] fourni.
  ///
  /// Les compteurs d'IDs sont initialisés à `max(existingIds) + 1` pour éviter
  /// toute collision lors des créations ultérieures.
  static FakeGraphQLStore fromSeed(FakeGraphQLSeed seed) {
    return FakeGraphQLStore(
      trips: {for (final t in seed.trips) t.id: t},
      waypoints: {for (final w in seed.waypoints) w.id: w},
      segments: {for (final s in seed.segments) s.id: s},
      vertices: {for (final v in seed.vertices) v.id: v},
      carouselItems: {
        for (final (fileKey, item) in seed.carouselItems) fileKey: item,
      },
      // Copie profonde des listes pour que chaque store ait son propre état mutable.
      tripWaypointIds: {
        for (final e in seed.tripWaypointIds.entries) e.key: List.of(e.value),
      },
      tripSegmentIds: {
        for (final e in seed.tripSegmentIds.entries) e.key: List.of(e.value),
      },
      tripVertexIds: {
        for (final e in seed.tripVertexIds.entries) e.key: List.of(e.value),
      },
      nextTripId: _nextId(seed.trips.map((t) => t.id)),
      nextWaypointId: _nextId(seed.waypoints.map((w) => w.id)),
      nextSegmentId: _nextId(seed.segments.map((s) => s.id)),
      nextVertexId: _nextId(seed.vertices.map((v) => v.id)),
    );
  }

  static int _nextId(Iterable<int> ids) {
    if (ids.isEmpty) return 1;
    return ids.reduce(max) + 1;
  }
}
