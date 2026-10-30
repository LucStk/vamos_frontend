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
        $FunctionalProvider<
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?
        >
    with $Provider<TripOriginItem<MapRouteOrigin>?> {
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
  $ProviderElement<TripOriginItem<MapRouteOrigin>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripOriginItem<MapRouteOrigin>? create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return tripOriginItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripOriginItem<MapRouteOrigin>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripOriginItem<MapRouteOrigin>?>(
        value,
      ),
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

String _$tripOriginItemHash() => r'36e741ae332cfc43b2f3dc43494a4c47a1f4e663';

final class TripOriginItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          TripOriginItem<MapRouteOrigin>?,
          (TripId, MapCameraReader)
        > {
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
