// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripStore)
final tripStoreProvider = TripStoreProvider._();

final class TripStoreProvider
    extends $FunctionalProvider<TripStore, TripStore, TripStore>
    with $Provider<TripStore> {
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
  $ProviderElement<TripStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripStore create(Ref ref) {
    return tripStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripStore>(value),
    );
  }
}

String _$tripStoreHash() => r'0a6549797e652f1a3d0b4c9c1c5efb496e79eb35';
