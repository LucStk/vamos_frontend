// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
         isAutoDispose: true,
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

String _$tripHash() => r'e84d34ed9cad921ffb306d6c42603174dc086aaa';

final class TripFamily extends $Family
    with $FunctionalFamilyOverride<Trip?, TripId> {
  TripFamily._()
    : super(
        retry: null,
        name: r'tripProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripProvider call(TripId tripId) =>
      TripProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripProvider';
}

@ProviderFor(tripQueryHandler)
final tripQueryHandlerProvider = TripQueryHandlerProvider._();

final class TripQueryHandlerProvider
    extends
        $FunctionalProvider<
          TripQueryHandler,
          TripQueryHandler,
          TripQueryHandler
        >
    with $Provider<TripQueryHandler> {
  TripQueryHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripQueryHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripQueryHandlerHash();

  @$internal
  @override
  $ProviderElement<TripQueryHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripQueryHandler create(Ref ref) {
    return tripQueryHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripQueryHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripQueryHandler>(value),
    );
  }
}

String _$tripQueryHandlerHash() => r'30dd6ab3c199c292dc4f33f1b7ebadfe3394f070';

@ProviderFor(loadTrips)
final loadTripsProvider = LoadTripsProvider._();

final class LoadTripsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  LoadTripsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadTripsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadTripsHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return loadTrips(ref);
  }
}

String _$loadTripsHash() => r'5e88e56df73f765fc2b46b5eab87484ab9cf72d3';
