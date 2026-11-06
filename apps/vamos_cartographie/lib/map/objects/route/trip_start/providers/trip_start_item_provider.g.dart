// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_start_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripOriginItem)
final tripOriginItemProvider = TripStartItemFamily._();

final class TripStartItemProvider
    extends
        $FunctionalProvider<
          TripStartItem<MapRouteOrigin>?,
          TripStartItem<MapRouteOrigin>?,
          TripStartItem<MapRouteOrigin>?
        >
    with $Provider<TripStartItem<MapRouteOrigin>?> {
  TripStartItemProvider._({
    required TripStartItemFamily super.from,
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
  $ProviderElement<TripStartItem<MapRouteOrigin>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripStartItem<MapRouteOrigin>? create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return tripOriginItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripStartItem<MapRouteOrigin>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripStartItem<MapRouteOrigin>?>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripStartItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripOriginItemHash() => r'36e741ae332cfc43b2f3dc43494a4c47a1f4e663';

final class TripStartItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          TripStartItem<MapRouteOrigin>?,
          (TripId, MapCameraReader)
        > {
  TripStartItemFamily._()
    : super(
        retry: null,
        name: r'tripOriginItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripStartItemProvider call(TripId tripId, MapCameraReader camera) =>
      TripStartItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'tripOriginItemProvider';
}
