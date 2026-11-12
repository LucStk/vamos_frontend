// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_trips_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Source de vérité des favoris de [userId].
///
/// `add` / `remove` mettent la liste à jour localement (optimiste, avec
/// rollback si l'appel échoue) : l'onglet Favoris et un éventuel bouton
/// « favori » sur la fiche d'un voyage restent synchronisés sans refetch.
///
/// Sémantique : `favoriteTripsProvider(me).notifier.add(summary)` veut dire
/// « j'ajoute ce voyage à mes favoris ». Seul l'utilisateur connecté peut
/// modifier ses propres favoris.

@ProviderFor(FavoriteTrips)
final favoriteTripsProvider = FavoriteTripsFamily._();

/// Source de vérité des favoris de [userId].
///
/// `add` / `remove` mettent la liste à jour localement (optimiste, avec
/// rollback si l'appel échoue) : l'onglet Favoris et un éventuel bouton
/// « favori » sur la fiche d'un voyage restent synchronisés sans refetch.
///
/// Sémantique : `favoriteTripsProvider(me).notifier.add(summary)` veut dire
/// « j'ajoute ce voyage à mes favoris ». Seul l'utilisateur connecté peut
/// modifier ses propres favoris.
final class FavoriteTripsProvider
    extends $AsyncNotifierProvider<FavoriteTrips, List<TripSummary>> {
  /// Source de vérité des favoris de [userId].
  ///
  /// `add` / `remove` mettent la liste à jour localement (optimiste, avec
  /// rollback si l'appel échoue) : l'onglet Favoris et un éventuel bouton
  /// « favori » sur la fiche d'un voyage restent synchronisés sans refetch.
  ///
  /// Sémantique : `favoriteTripsProvider(me).notifier.add(summary)` veut dire
  /// « j'ajoute ce voyage à mes favoris ». Seul l'utilisateur connecté peut
  /// modifier ses propres favoris.
  FavoriteTripsProvider._({
    required FavoriteTripsFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'favoriteTripsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$favoriteTripsHash();

  @override
  String toString() {
    return r'favoriteTripsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FavoriteTrips create() => FavoriteTrips();

  @override
  bool operator ==(Object other) {
    return other is FavoriteTripsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$favoriteTripsHash() => r'b6bfe3a4c6673fc9098492e9e8524c2c9cd302ea';

/// Source de vérité des favoris de [userId].
///
/// `add` / `remove` mettent la liste à jour localement (optimiste, avec
/// rollback si l'appel échoue) : l'onglet Favoris et un éventuel bouton
/// « favori » sur la fiche d'un voyage restent synchronisés sans refetch.
///
/// Sémantique : `favoriteTripsProvider(me).notifier.add(summary)` veut dire
/// « j'ajoute ce voyage à mes favoris ». Seul l'utilisateur connecté peut
/// modifier ses propres favoris.

final class FavoriteTripsFamily extends $Family
    with
        $ClassFamilyOverride<
          FavoriteTrips,
          AsyncValue<List<TripSummary>>,
          List<TripSummary>,
          FutureOr<List<TripSummary>>,
          UserId
        > {
  FavoriteTripsFamily._()
    : super(
        retry: null,
        name: r'favoriteTripsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Source de vérité des favoris de [userId].
  ///
  /// `add` / `remove` mettent la liste à jour localement (optimiste, avec
  /// rollback si l'appel échoue) : l'onglet Favoris et un éventuel bouton
  /// « favori » sur la fiche d'un voyage restent synchronisés sans refetch.
  ///
  /// Sémantique : `favoriteTripsProvider(me).notifier.add(summary)` veut dire
  /// « j'ajoute ce voyage à mes favoris ». Seul l'utilisateur connecté peut
  /// modifier ses propres favoris.

  FavoriteTripsProvider call(UserId userId) =>
      FavoriteTripsProvider._(argument: userId, from: this);

  @override
  String toString() => r'favoriteTripsProvider';
}

/// Source de vérité des favoris de [userId].
///
/// `add` / `remove` mettent la liste à jour localement (optimiste, avec
/// rollback si l'appel échoue) : l'onglet Favoris et un éventuel bouton
/// « favori » sur la fiche d'un voyage restent synchronisés sans refetch.
///
/// Sémantique : `favoriteTripsProvider(me).notifier.add(summary)` veut dire
/// « j'ajoute ce voyage à mes favoris ». Seul l'utilisateur connecté peut
/// modifier ses propres favoris.

abstract class _$FavoriteTrips extends $AsyncNotifier<List<TripSummary>> {
  late final _$args = ref.$arg as UserId;
  UserId get userId => _$args;

  FutureOr<List<TripSummary>> build(UserId userId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<TripSummary>>, List<TripSummary>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TripSummary>>, List<TripSummary>>,
              AsyncValue<List<TripSummary>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// Statut de chargement des favoris (même contrat que `loadUserTripsProvider`).
///
/// Dérivé de [favoriteTripsProvider] : pour relancer le chargement, invalide
/// `favoriteTripsProvider(userId)`, pas ce provider-ci.

@ProviderFor(loadFavoriteTrips)
final loadFavoriteTripsProvider = LoadFavoriteTripsFamily._();

/// Statut de chargement des favoris (même contrat que `loadUserTripsProvider`).
///
/// Dérivé de [favoriteTripsProvider] : pour relancer le chargement, invalide
/// `favoriteTripsProvider(userId)`, pas ce provider-ci.

final class LoadFavoriteTripsProvider
    extends
        $FunctionalProvider<
          AsyncValue<void>,
          AsyncValue<void>,
          AsyncValue<void>
        >
    with $Provider<AsyncValue<void>> {
  /// Statut de chargement des favoris (même contrat que `loadUserTripsProvider`).
  ///
  /// Dérivé de [favoriteTripsProvider] : pour relancer le chargement, invalide
  /// `favoriteTripsProvider(userId)`, pas ce provider-ci.
  LoadFavoriteTripsProvider._({
    required LoadFavoriteTripsFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'loadFavoriteTripsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadFavoriteTripsHash();

  @override
  String toString() {
    return r'loadFavoriteTripsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<void>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AsyncValue<void> create(Ref ref) {
    final argument = this.argument as UserId;
    return loadFavoriteTrips(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LoadFavoriteTripsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadFavoriteTripsHash() => r'571c3c202d906ecf465f4c8a8ffc781d23060f3c';

/// Statut de chargement des favoris (même contrat que `loadUserTripsProvider`).
///
/// Dérivé de [favoriteTripsProvider] : pour relancer le chargement, invalide
/// `favoriteTripsProvider(userId)`, pas ce provider-ci.

final class LoadFavoriteTripsFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<void>, UserId> {
  LoadFavoriteTripsFamily._()
    : super(
        retry: null,
        name: r'loadFavoriteTripsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Statut de chargement des favoris (même contrat que `loadUserTripsProvider`).
  ///
  /// Dérivé de [favoriteTripsProvider] : pour relancer le chargement, invalide
  /// `favoriteTripsProvider(userId)`, pas ce provider-ci.

  LoadFavoriteTripsProvider call(UserId userId) =>
      LoadFavoriteTripsProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadFavoriteTripsProvider';
}

/// Données des favoris (même contrat que `userTripSummariesProvider`).

@ProviderFor(favoriteTripSummaries)
final favoriteTripSummariesProvider = FavoriteTripSummariesFamily._();

/// Données des favoris (même contrat que `userTripSummariesProvider`).

final class FavoriteTripSummariesProvider
    extends
        $FunctionalProvider<
          List<TripSummary>,
          List<TripSummary>,
          List<TripSummary>
        >
    with $Provider<List<TripSummary>> {
  /// Données des favoris (même contrat que `userTripSummariesProvider`).
  FavoriteTripSummariesProvider._({
    required FavoriteTripSummariesFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'favoriteTripSummariesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$favoriteTripSummariesHash();

  @override
  String toString() {
    return r'favoriteTripSummariesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<TripSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<TripSummary> create(Ref ref) {
    final argument = this.argument as UserId;
    return favoriteTripSummaries(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TripSummary> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TripSummary>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteTripSummariesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$favoriteTripSummariesHash() =>
    r'a33de66bcd08fe9a72bcab1cf1fbcdba000862d9';

/// Données des favoris (même contrat que `userTripSummariesProvider`).

final class FavoriteTripSummariesFamily extends $Family
    with $FunctionalFamilyOverride<List<TripSummary>, UserId> {
  FavoriteTripSummariesFamily._()
    : super(
        retry: null,
        name: r'favoriteTripSummariesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Données des favoris (même contrat que `userTripSummariesProvider`).

  FavoriteTripSummariesProvider call(UserId userId) =>
      FavoriteTripSummariesProvider._(argument: userId, from: this);

  @override
  String toString() => r'favoriteTripSummariesProvider';
}
