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

String _$tripOriginItemHash() => r'1388391bdae6b21b2e1f0778f20056e89972396e';

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

@ProviderFor(tmpOriginItem)
final tmpOriginItemProvider = TmpOriginItemFamily._();

final class TmpOriginItemProvider
    extends
        $FunctionalProvider<
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?
        >
    with $Provider<TripOriginItem<MapRouteOrigin>?> {
  TmpOriginItemProvider._({
    required TmpOriginItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'tmpOriginItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tmpOriginItemHash();

  @override
  String toString() {
    return r'tmpOriginItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TripOriginItem<MapRouteOrigin>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripOriginItem<MapRouteOrigin>? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return tmpOriginItem(ref, argument);
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
    return other is TmpOriginItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tmpOriginItemHash() => r'0d0a3a55ad56ca10fedef1d75c204133f9cc0b2d';

final class TmpOriginItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          TripOriginItem<MapRouteOrigin>?,
          MapCameraReader
        > {
  TmpOriginItemFamily._()
    : super(
        retry: null,
        name: r'tmpOriginItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TmpOriginItemProvider call(MapCameraReader camera) =>
      TmpOriginItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'tmpOriginItemProvider';
}
