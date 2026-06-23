// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rawTripStore)
final rawTripStoreProvider = RawTripStoreProvider._();

final class RawTripStoreProvider
    extends $FunctionalProvider<TripStore, TripStore, TripStore>
    with $Provider<TripStore> {
  RawTripStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawTripStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawTripStoreHash();

  @$internal
  @override
  $ProviderElement<TripStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripStore create(Ref ref) {
    return rawTripStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripStore>(value),
    );
  }
}

String _$rawTripStoreHash() => r'2330277caf76bb253497ab03b29a75fff822f8a8';

@ProviderFor(tripStore)
final tripStoreProvider = TripStoreProvider._();

final class TripStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<TripId, Trip>>,
          Map<TripId, Trip>,
          Stream<Map<TripId, Trip>>
        >
    with
        $FutureModifier<Map<TripId, Trip>>,
        $StreamProvider<Map<TripId, Trip>> {
  TripStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripStoreHash();

  @$internal
  @override
  $StreamProviderElement<Map<TripId, Trip>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<TripId, Trip>> create(Ref ref) {
    return tripStore(ref);
  }
}

String _$tripStoreHash() => r'424071f63b76f85c8f7728c94ef15cf4ac152ceb';
