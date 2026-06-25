// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripHandler)
final tripHandlerProvider = TripHandlerProvider._();

final class TripHandlerProvider
    extends $FunctionalProvider<TripHandler, TripHandler, TripHandler>
    with $Provider<TripHandler> {
  TripHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripHandlerHash();

  @$internal
  @override
  $ProviderElement<TripHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripHandler create(Ref ref) {
    return tripHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripHandler>(value),
    );
  }
}

String _$tripHandlerHash() => r'077bd56f08e34fff866c3410bcde341fd75b354f';

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

String _$loadTripsHash() => r'99e16af5988a5f20bcb4b66c9bcd4f6c5dc8c25d';
