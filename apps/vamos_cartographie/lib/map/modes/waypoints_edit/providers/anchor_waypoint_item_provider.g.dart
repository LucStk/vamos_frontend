// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anchor_waypoint_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(anchorWaypointItem)
final anchorWaypointItemProvider = AnchorWaypointItemFamily._();

final class AnchorWaypointItemProvider
    extends $FunctionalProvider<SceneItem?, SceneItem?, SceneItem?>
    with $Provider<SceneItem?> {
  AnchorWaypointItemProvider._({
    required AnchorWaypointItemFamily super.from,
    required (TripId, WaypointId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'anchorWaypointItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$anchorWaypointItemHash();

  @override
  String toString() {
    return r'anchorWaypointItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<SceneItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SceneItem? create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId, MapCameraReader);
    return anchorWaypointItem(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SceneItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SceneItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AnchorWaypointItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$anchorWaypointItemHash() =>
    r'75ad095f37c7c9e6c4b566b31f3d2408570a7d83';

final class AnchorWaypointItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          SceneItem?,
          (TripId, WaypointId, MapCameraReader)
        > {
  AnchorWaypointItemFamily._()
    : super(
        retry: null,
        name: r'anchorWaypointItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AnchorWaypointItemProvider call(
    TripId tripId,
    WaypointId waypointId,
    MapCameraReader camera,
  ) => AnchorWaypointItemProvider._(
    argument: (tripId, waypointId, camera),
    from: this,
  );

  @override
  String toString() => r'anchorWaypointItemProvider';
}

@ProviderFor(allWaypointAnchorItem)
final allWaypointAnchorItemProvider = AllWaypointAnchorItemFamily._();

final class AllWaypointAnchorItemProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  AllWaypointAnchorItemProvider._({
    required AllWaypointAnchorItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'allWaypointAnchorItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allWaypointAnchorItemHash();

  @override
  String toString() {
    return r'allWaypointAnchorItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return allWaypointAnchorItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SceneItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SceneItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllWaypointAnchorItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allWaypointAnchorItemHash() =>
    r'291366f092d573fe0613f2a6636a88109836a437';

final class AllWaypointAnchorItemFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, (TripId, MapCameraReader)> {
  AllWaypointAnchorItemFamily._()
    : super(
        retry: null,
        name: r'allWaypointAnchorItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AllWaypointAnchorItemProvider call(TripId tripId, MapCameraReader camera) =>
      AllWaypointAnchorItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'allWaypointAnchorItemProvider';
}
