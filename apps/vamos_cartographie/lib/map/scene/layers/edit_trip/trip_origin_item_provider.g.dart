// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_origin_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripOriginItem)
final tripOriginItemProvider = TripOriginItemFamily._();

final class TripOriginItemProvider
    extends
        $FunctionalProvider<TripOriginItem?, TripOriginItem?, TripOriginItem?>
    with $Provider<TripOriginItem?> {
  TripOriginItemProvider._({
    required TripOriginItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'tripOriginItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripOriginItemHash();

  @override
  String toString() {
    return r'tripOriginItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<TripOriginItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripOriginItem? create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return tripOriginItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripOriginItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripOriginItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripOriginItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripOriginItemHash() => r'83005a097faec79fed6e7cbf8b0e9ca3f701e108';

final class TripOriginItemFamily extends $Family
    with $FunctionalFamilyOverride<TripOriginItem?, (TripId, MapCameraReader)> {
  TripOriginItemFamily._()
    : super(
        retry: null,
        name: r'tripOriginItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripOriginItemProvider call(TripId tripId, MapCameraReader camera) =>
      TripOriginItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'tripOriginItemProvider';
}
