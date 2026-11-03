// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_trips_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userTripsIds)
final userTripsIdsProvider = UserTripsIdsFamily._();

final class UserTripsIdsProvider
    extends
        $FunctionalProvider<
          Iterable<TripId>,
          Iterable<TripId>,
          Iterable<TripId>
        >
    with $Provider<Iterable<TripId>> {
  UserTripsIdsProvider._({
    required UserTripsIdsFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userTripsIdsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userTripsIdsHash();

  @override
  String toString() {
    return r'userTripsIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Iterable<TripId>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Iterable<TripId> create(Ref ref) {
    final argument = this.argument as UserId;
    return userTripsIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<TripId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<TripId>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserTripsIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userTripsIdsHash() => r'a49866258f9ff52cb6de49d9b4db704a60e7755f';

final class UserTripsIdsFamily extends $Family
    with $FunctionalFamilyOverride<Iterable<TripId>, UserId> {
  UserTripsIdsFamily._()
    : super(
        retry: null,
        name: r'userTripsIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  UserTripsIdsProvider call(UserId userId) =>
      UserTripsIdsProvider._(argument: userId, from: this);

  @override
  String toString() => r'userTripsIdsProvider';
}

@ProviderFor(userTrips)
final userTripsProvider = UserTripsFamily._();

final class UserTripsProvider
    extends $FunctionalProvider<List<Trip>, List<Trip>, List<Trip>>
    with $Provider<List<Trip>> {
  UserTripsProvider._({
    required UserTripsFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userTripsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userTripsHash();

  @override
  String toString() {
    return r'userTripsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Trip>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Trip> create(Ref ref) {
    final argument = this.argument as UserId;
    return userTrips(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Trip> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Trip>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserTripsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userTripsHash() => r'0d4eaf6db0c3575175a3ba9f5334a9064a708c2d';

final class UserTripsFamily extends $Family
    with $FunctionalFamilyOverride<List<Trip>, UserId> {
  UserTripsFamily._()
    : super(
        retry: null,
        name: r'userTripsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserTripsProvider call(UserId userId) =>
      UserTripsProvider._(argument: userId, from: this);

  @override
  String toString() => r'userTripsProvider';
}

/// Données : reconstruites depuis les stores (trips indexés par owner + fichiers par trip).

@ProviderFor(userTripSummaries)
final userTripSummariesProvider = UserTripSummariesFamily._();

/// Données : reconstruites depuis les stores (trips indexés par owner + fichiers par trip).

final class UserTripSummariesProvider
    extends
        $FunctionalProvider<
          List<TripSummary>,
          List<TripSummary>,
          List<TripSummary>
        >
    with $Provider<List<TripSummary>> {
  /// Données : reconstruites depuis les stores (trips indexés par owner + fichiers par trip).
  UserTripSummariesProvider._({
    required UserTripSummariesFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userTripSummariesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userTripSummariesHash();

  @override
  String toString() {
    return r'userTripSummariesProvider'
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
    return userTripSummaries(ref, argument);
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
    return other is UserTripSummariesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userTripSummariesHash() => r'904eb584964cf0dbf792715e34fc9b9f3b31d2bf';

/// Données : reconstruites depuis les stores (trips indexés par owner + fichiers par trip).

final class UserTripSummariesFamily extends $Family
    with $FunctionalFamilyOverride<List<TripSummary>, UserId> {
  UserTripSummariesFamily._()
    : super(
        retry: null,
        name: r'userTripSummariesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Données : reconstruites depuis les stores (trips indexés par owner + fichiers par trip).

  UserTripSummariesProvider call(UserId userId) =>
      UserTripSummariesProvider._(argument: userId, from: this);

  @override
  String toString() => r'userTripSummariesProvider';
}
