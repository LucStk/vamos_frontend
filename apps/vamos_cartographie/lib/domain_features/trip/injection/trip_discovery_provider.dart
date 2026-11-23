import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_data_loader.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/domain_features/user_profile/user_profile.dart';
import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';

part 'trip_discovery_provider.g.dart';

/// Filtres de découverte choisis par l'utilisateur.
@Riverpod(keepAlive: true)
class TripDiscoveryFiltersNotifier extends _$TripDiscoveryFiltersNotifier {
  @override
  TripDiscoveryFilters build() => TripDiscoveryFilters.none;

  void set(TripDiscoveryFilters filters) => state = filters;
}

/// Voyages à dessiner pour la vue courante.
final class TripDiscoveryState {
  const TripDiscoveryState({this.trips = const [], this.loading = false});

  final List<VisibleTrip> trips;
  final bool loading;

  @override
  bool operator ==(Object other) =>
      other is TripDiscoveryState &&
      other.loading == loading &&
      listEquals(other.trips, trips);

  @override
  int get hashCode => Object.hash(loading, Object.hashAll(trips));
}

/// Suit la caméra : à chaque arrêt du geste, calcule les tuiles de la vue,
/// affiche aussitôt ce que le cache en sait, et demande au serveur les tuiles
/// manquantes ou périmées (une seule requête pour toutes).
///
/// Le cache vit dans le notifier : il survit aux changements de filtres et de
/// caméra, ce qui permet de réafficher sans requête une zone déjà vue.
@Riverpod(keepAlive: true)
class TripDiscovery extends _$TripDiscovery {
  static const _debounce = Duration(milliseconds: 250);
  static const _perTile = 12;

  final _cache = TripDiscoveryCache();
  final _inFlight = <(TripDiscoveryFilters, DiscoveryTile)>{};
  Timer? _timer;
  int? _level;

  @override
  TripDiscoveryState build() {
    final camera = ref.watch(readyCameraProvider);
    final filters = ref.watch(tripDiscoveryFiltersProvider);
    if (camera == null) return const TripDiscoveryState();

    final sub = camera.events.listen((_) {
      _timer?.cancel();
      _timer = Timer(_debounce, () => _refresh(camera, filters));
    });
    ref.onDispose(() {
      sub.cancel();
      _timer?.cancel();
    });

    // Vue initiale, ou nouveaux filtres : pas d'attente du prochain geste.
    Future.microtask(() => _refresh(camera, filters));
    return const TripDiscoveryState();
  }

  Future<void> _refresh(
    FlutterMapCamera camera,
    TripDiscoveryFilters filters,
  ) async {
    if (!ref.mounted) return;
    final size = camera.size;
    _level = DiscoveryTile.levelFor(
      zoom: camera.pose.zoom,
      viewportMaxPx: math.max(size.width, size.height),
      current: _level,
    );
    final tiles = DiscoveryTile.covering(camera.visibleBounds, _level!);
    final missing = _cache
        .missing(filters, tiles, DateTime.now())
        .where((t) => !_inFlight.contains((filters, t)))
        .toList();

    _emit(camera, filters, loading: missing.isNotEmpty);
    if (missing.isEmpty) return;

    final keys = [for (final t in missing) (filters, t)];
    _inFlight.addAll(keys);
    final result = await ref
        .read(tripRepositoryProvider)
        .discoverTrips(missing, filters, perTile: _perTile);
    _inFlight.removeAll(keys);
    if (!ref.mounted) return;

    result.fold((failure) => debugPrint('discoverTrips : $failure'), (tiles) {
      _ingest(tiles);
      final now = DateTime.now();
      for (final tile in tiles) {
        _cache.put(filters, tile, now);
      }
    });
    // La caméra a pu bouger pendant la requête : on recalcule sur la vue
    // actuelle (si les filtres ont changé entre-temps, ce lot est en cache
    // sous les anciens filtres et ne s'affiche pas).
    _emit(camera, ref.read(tripDiscoveryFiltersProvider));
  }

  void _emit(
    FlutterMapCamera camera,
    TripDiscoveryFilters filters, {
    bool? loading,
  }) {
    final level = _level;
    if (level == null) return;
    final viewport = camera.visibleBounds;
    state = TripDiscoveryState(
      trips: _cache.visible(
        filters: filters,
        tiles: DiscoveryTile.covering(viewport, level),
        viewport: viewport,
      ),
      loading: loading ?? _inFlight.isNotEmpty,
    );
  }

  /// Les voyages reçus rejoignent les stores (titre, photos, auteur), comme
  /// ceux d'un profil : la feuille d'un voyage s'ouvre sans requête de plus.
  void _ingest(List<DiscoveryTileResult> tiles) {
    final trips = [for (final tile in tiles) ...tile.trips];
    if (trips.isEmpty) return;
    ingestTripSummaries(ref, [for (final t in trips) t.summary]);
    var profiles = ref.read(profileStoreProvider);
    for (final t in trips) {
      profiles = profiles.insertProfile(t.owner);
    }
    ref.read(profileStoreProvider.notifier).emit(profiles);
  }
}
