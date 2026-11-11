// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoints_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pendingWaypoint)
final pendingWaypointProvider = PendingWaypointFamily._();

final class PendingWaypointProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  PendingWaypointProvider._({
    required PendingWaypointFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'pendingWaypointProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = modeSlotProvider;
  static final $allTransitiveDependencies1 =
      ModeSlotProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$pendingWaypointHash();

  @override
  String toString() {
    return r'pendingWaypointProvider'
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
    return pendingWaypoint(ref, argument.$1, argument.$2);
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
    return other is PendingWaypointProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pendingWaypointHash() => r'6ee590b0ac4b8442acfcfb2bc2290d8ab8529a97';

final class PendingWaypointFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, (TripId, MapCameraReader)> {
  PendingWaypointFamily._()
    : super(
        retry: null,
        name: r'pendingWaypointProvider',
        dependencies: <ProviderOrFamily>[modeSlotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          PendingWaypointProvider.$allTransitiveDependencies0,
          PendingWaypointProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  PendingWaypointProvider call(TripId tripId, MapCameraReader camera) =>
      PendingWaypointProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'pendingWaypointProvider';
}
