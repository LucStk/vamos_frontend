// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_end_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripEndItem)
final tripEndItemProvider = TripEndItemFamily._();

final class TripEndItemProvider
    extends $FunctionalProvider<TripEndItem?, TripEndItem?, TripEndItem?>
    with $Provider<TripEndItem?> {
  TripEndItemProvider._({
    required TripEndItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'tripEndItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripEndItemHash();

  @override
  String toString() {
    return r'tripEndItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<TripEndItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripEndItem? create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return tripEndItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripEndItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripEndItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripEndItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripEndItemHash() => r'39cb8b16df46d1612d3f0fdb15135d8c256c01ea';

final class TripEndItemFamily extends $Family
    with $FunctionalFamilyOverride<TripEndItem?, (TripId, MapCameraReader)> {
  TripEndItemFamily._()
    : super(
        retry: null,
        name: r'tripEndItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripEndItemProvider call(TripId tripId, MapCameraReader camera) =>
      TripEndItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'tripEndItemProvider';
}
