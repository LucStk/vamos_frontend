// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripItem)
final tripItemProvider = TripItemFamily._();

final class TripItemProvider
    extends $FunctionalProvider<TripItem, TripItem, TripItem>
    with $Provider<TripItem> {
  TripItemProvider._({
    required TripItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'tripItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripItemHash();

  @override
  String toString() {
    return r'tripItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<TripItem> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripItem create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return tripItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripItem value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripItem>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripItemHash() => r'fe3a03bc2e169934024f7b52ac89d734fcefbe21';

final class TripItemFamily extends $Family
    with $FunctionalFamilyOverride<TripItem, (TripId, MapCameraReader)> {
  TripItemFamily._()
    : super(
        retry: null,
        name: r'tripItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: true,
      );

  TripItemProvider call(TripId tripId, MapCameraReader camera) =>
      TripItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'tripItemProvider';
}
