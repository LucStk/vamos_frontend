// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_trip_object.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapTripObject)
final mapTripObjectProvider = MapTripObjectFamily._();

final class MapTripObjectProvider
    extends $FunctionalProvider<MapTripObject, MapTripObject, MapTripObject>
    with $Provider<MapTripObject> {
  MapTripObjectProvider._({
    required MapTripObjectFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mapTripObjectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapTripObjectHash();

  @override
  String toString() {
    return r'mapTripObjectProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MapTripObject> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapTripObject create(Ref ref) {
    final argument = this.argument as TripId;
    return mapTripObject(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapTripObject value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapTripObject>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapTripObjectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapTripObjectHash() => r'eebcb11f8ed374a612d94580cac17ad1763a649a';

final class MapTripObjectFamily extends $Family
    with $FunctionalFamilyOverride<MapTripObject, TripId> {
  MapTripObjectFamily._()
    : super(
        retry: null,
        name: r'mapTripObjectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapTripObjectProvider call(TripId tripId) =>
      MapTripObjectProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapTripObjectProvider';
}
