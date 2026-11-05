// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waypointItem)
final waypointItemProvider = WaypointItemFamily._();

final class WaypointItemProvider
    extends $FunctionalProvider<WaypointItem, WaypointItem, WaypointItem>
    with $Provider<WaypointItem> {
  WaypointItemProvider._({
    required WaypointItemFamily super.from,
    required (TripId, WaypointId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'waypointItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointItemHash();

  @override
  String toString() {
    return r'waypointItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<WaypointItem> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointItem create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId, MapCameraReader);
    return waypointItem(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointItem value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointItem>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointItemHash() => r'fdfbe006405c8467cb22eab6914f4b1bccbba249';

final class WaypointItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          WaypointItem,
          (TripId, WaypointId, MapCameraReader)
        > {
  WaypointItemFamily._()
    : super(
        retry: null,
        name: r'waypointItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  WaypointItemProvider call(
    TripId tripId,
    WaypointId id,
    MapCameraReader cameraReader,
  ) => WaypointItemProvider._(argument: (tripId, id, cameraReader), from: this);

  @override
  String toString() => r'waypointItemProvider';
}

@ProviderFor(allWaypointItem)
final allWaypointItemProvider = AllWaypointItemFamily._();

final class AllWaypointItemProvider
    extends
        $FunctionalProvider<List<PointItem>, List<PointItem>, List<PointItem>>
    with $Provider<List<PointItem>> {
  AllWaypointItemProvider._({
    required AllWaypointItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'allWaypointItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allWaypointItemHash();

  @override
  String toString() {
    return r'allWaypointItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<PointItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<PointItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return allWaypointItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PointItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PointItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllWaypointItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allWaypointItemHash() => r'9c72980212a278315e94d837ec7e2944f2b8a6b0';

final class AllWaypointItemFamily extends $Family
    with $FunctionalFamilyOverride<List<PointItem>, (TripId, MapCameraReader)> {
  AllWaypointItemFamily._()
    : super(
        retry: null,
        name: r'allWaypointItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AllWaypointItemProvider call(TripId tripId, MapCameraReader camera) =>
      AllWaypointItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'allWaypointItemProvider';
}
