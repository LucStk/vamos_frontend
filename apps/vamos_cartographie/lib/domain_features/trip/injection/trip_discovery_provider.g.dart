// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_discovery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Filtres de découverte choisis par l'utilisateur.

@ProviderFor(TripDiscoveryFiltersNotifier)
final tripDiscoveryFiltersProvider = TripDiscoveryFiltersNotifierProvider._();

/// Filtres de découverte choisis par l'utilisateur.
final class TripDiscoveryFiltersNotifierProvider
    extends
        $NotifierProvider<TripDiscoveryFiltersNotifier, TripDiscoveryFilters> {
  /// Filtres de découverte choisis par l'utilisateur.
  TripDiscoveryFiltersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripDiscoveryFiltersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripDiscoveryFiltersNotifierHash();

  @$internal
  @override
  TripDiscoveryFiltersNotifier create() => TripDiscoveryFiltersNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripDiscoveryFilters value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripDiscoveryFilters>(value),
    );
  }
}

String _$tripDiscoveryFiltersNotifierHash() =>
    r'9cff3b37fdf12d077d5245661f09d61db519218f';

/// Filtres de découverte choisis par l'utilisateur.

abstract class _$TripDiscoveryFiltersNotifier
    extends $Notifier<TripDiscoveryFilters> {
  TripDiscoveryFilters build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TripDiscoveryFilters, TripDiscoveryFilters>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripDiscoveryFilters, TripDiscoveryFilters>,
              TripDiscoveryFilters,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Suit la caméra : à chaque arrêt du geste, calcule les tuiles de la vue,
/// affiche aussitôt ce que le cache en sait, et demande au serveur les tuiles
/// manquantes ou périmées (une seule requête pour toutes).
///
/// Le cache vit dans le notifier : il survit aux changements de filtres et de
/// caméra, ce qui permet de réafficher sans requête une zone déjà vue.

@ProviderFor(TripDiscovery)
final tripDiscoveryProvider = TripDiscoveryProvider._();

/// Suit la caméra : à chaque arrêt du geste, calcule les tuiles de la vue,
/// affiche aussitôt ce que le cache en sait, et demande au serveur les tuiles
/// manquantes ou périmées (une seule requête pour toutes).
///
/// Le cache vit dans le notifier : il survit aux changements de filtres et de
/// caméra, ce qui permet de réafficher sans requête une zone déjà vue.
final class TripDiscoveryProvider
    extends $NotifierProvider<TripDiscovery, TripDiscoveryState> {
  /// Suit la caméra : à chaque arrêt du geste, calcule les tuiles de la vue,
  /// affiche aussitôt ce que le cache en sait, et demande au serveur les tuiles
  /// manquantes ou périmées (une seule requête pour toutes).
  ///
  /// Le cache vit dans le notifier : il survit aux changements de filtres et de
  /// caméra, ce qui permet de réafficher sans requête une zone déjà vue.
  TripDiscoveryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripDiscoveryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripDiscoveryHash();

  @$internal
  @override
  TripDiscovery create() => TripDiscovery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripDiscoveryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripDiscoveryState>(value),
    );
  }
}

String _$tripDiscoveryHash() => r'5776413bc933ef087ba372f6d185af0e40d35b6e';

/// Suit la caméra : à chaque arrêt du geste, calcule les tuiles de la vue,
/// affiche aussitôt ce que le cache en sait, et demande au serveur les tuiles
/// manquantes ou périmées (une seule requête pour toutes).
///
/// Le cache vit dans le notifier : il survit aux changements de filtres et de
/// caméra, ce qui permet de réafficher sans requête une zone déjà vue.

abstract class _$TripDiscovery extends $Notifier<TripDiscoveryState> {
  TripDiscoveryState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TripDiscoveryState, TripDiscoveryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripDiscoveryState, TripDiscoveryState>,
              TripDiscoveryState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
