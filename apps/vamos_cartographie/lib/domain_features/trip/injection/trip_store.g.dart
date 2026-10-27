// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripRemoteDatasource)
final tripRemoteDatasourceProvider = TripRemoteDatasourceProvider._();

final class TripRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          TripRemoteDatasource,
          TripRemoteDatasource,
          TripRemoteDatasource
        >
    with $Provider<TripRemoteDatasource> {
  TripRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<TripRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripRemoteDatasource create(Ref ref) {
    return tripRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripRemoteDatasource>(value),
    );
  }
}

String _$tripRemoteDatasourceHash() =>
    r'142554d89119ba1acf0dbd233bcfd80ce61a747a';

@ProviderFor(tripRepository)
final tripRepositoryProvider = TripRepositoryProvider._();

final class TripRepositoryProvider
    extends $FunctionalProvider<TripRepository, TripRepository, TripRepository>
    with $Provider<TripRepository> {
  TripRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripRepositoryHash();

  @$internal
  @override
  $ProviderElement<TripRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripRepository create(Ref ref) {
    return tripRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripRepository>(value),
    );
  }
}

String _$tripRepositoryHash() => r'fddc324aff912f0c4fe309bbfd6ebdcd4625453f';

@ProviderFor(TripStoreNotifier)
final tripStoreProvider = TripStoreNotifierProvider._();

final class TripStoreNotifierProvider
    extends $NotifierProvider<TripStoreNotifier, TripStore> {
  TripStoreNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripStoreNotifierHash();

  @$internal
  @override
  TripStoreNotifier create() => TripStoreNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripStore>(value),
    );
  }
}

String _$tripStoreNotifierHash() => r'733eaff2d43841eca58559bbc4a23c5e2ec7c76a';

abstract class _$TripStoreNotifier extends $Notifier<TripStore> {
  TripStore build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TripStore, TripStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripStore, TripStore>,
              TripStore,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(trip)
final tripProvider = TripFamily._();

final class TripProvider extends $FunctionalProvider<Trip?, Trip?, Trip?>
    with $Provider<Trip?> {
  TripProvider._({
    required TripFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripHash();

  @override
  String toString() {
    return r'tripProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Trip?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Trip? create(Ref ref) {
    final argument = this.argument as TripId;
    return trip(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Trip? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Trip?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripHash() => r'bc028a391a7a0d147894afba9dc2094e9f34efef';

final class TripFamily extends $Family
    with $FunctionalFamilyOverride<Trip?, TripId> {
  TripFamily._()
    : super(
        retry: null,
        name: r'tripProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripProvider call(TripId tripId) =>
      TripProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripProvider';
}

@ProviderFor(tripRequired)
final tripRequiredProvider = TripRequiredFamily._();

final class TripRequiredProvider extends $FunctionalProvider<Trip, Trip, Trip>
    with $Provider<Trip> {
  TripRequiredProvider._({
    required TripRequiredFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripRequiredProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripRequiredHash();

  @override
  String toString() {
    return r'tripRequiredProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Trip> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Trip create(Ref ref) {
    final argument = this.argument as TripId;
    return tripRequired(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Trip value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Trip>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripRequiredProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripRequiredHash() => r'765c7f25f09ee970398fcd148920e929398f0a0c';

final class TripRequiredFamily extends $Family
    with $FunctionalFamilyOverride<Trip, TripId> {
  TripRequiredFamily._()
    : super(
        retry: null,
        name: r'tripRequiredProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripRequiredProvider call(TripId tripId) =>
      TripRequiredProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripRequiredProvider';
}

@ProviderFor(tripIds)
final tripIdsProvider = TripIdsProvider._();

final class TripIdsProvider
    extends $FunctionalProvider<List<TripId>, List<TripId>, List<TripId>>
    with $Provider<List<TripId>> {
  TripIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripIdsHash();

  @$internal
  @override
  $ProviderElement<List<TripId>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<TripId> create(Ref ref) {
    return tripIds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TripId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TripId>>(value),
    );
  }
}

String _$tripIdsHash() => r'd0a50120d8766e9cff6865a2d85e1d9a712b2108';

@ProviderFor(isTripOwned)
final isTripOwnedProvider = IsTripOwnedFamily._();

final class IsTripOwnedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsTripOwnedProvider._({
    required IsTripOwnedFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'isTripOwnedProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isTripOwnedHash();

  @override
  String toString() {
    return r'isTripOwnedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as TripId;
    return isTripOwned(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsTripOwnedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isTripOwnedHash() => r'e4af0c07fad4d215abf5f39e14b354af1a029d09';

final class IsTripOwnedFamily extends $Family
    with $FunctionalFamilyOverride<bool, TripId> {
  IsTripOwnedFamily._()
    : super(
        retry: null,
        name: r'isTripOwnedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  IsTripOwnedProvider call(TripId tripId) =>
      IsTripOwnedProvider._(argument: tripId, from: this);

  @override
  String toString() => r'isTripOwnedProvider';
}

@ProviderFor(tripSummary)
final tripSummaryProvider = TripSummaryFamily._();

final class TripSummaryProvider
    extends $FunctionalProvider<TripSummary, TripSummary, TripSummary>
    with $Provider<TripSummary> {
  TripSummaryProvider._({
    required TripSummaryFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripSummaryProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripSummaryHash();

  @override
  String toString() {
    return r'tripSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TripSummary> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripSummary create(Ref ref) {
    final argument = this.argument as TripId;
    return tripSummary(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripSummary value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripSummary>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripSummaryHash() => r'4c79552849b48ba5b9d8e6c3e1ed87aa2653d5f0';

final class TripSummaryFamily extends $Family
    with $FunctionalFamilyOverride<TripSummary, TripId> {
  TripSummaryFamily._()
    : super(
        retry: null,
        name: r'tripSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripSummaryProvider call(TripId tripId) =>
      TripSummaryProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripSummaryProvider';
}
