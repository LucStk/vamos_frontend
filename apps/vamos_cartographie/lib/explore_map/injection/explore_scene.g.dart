// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_scene.dart';

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

String _$mapTripObjectHash() => r'41893386892c64f4ed4903fe78cde402aaaed6d7';

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

@ProviderFor(projectTrip)
final projectTripProvider = ProjectTripFamily._();

final class ProjectTripProvider
    extends $FunctionalProvider<ProjectedTrip, ProjectedTrip, ProjectedTrip>
    with $Provider<ProjectedTrip> {
  ProjectTripProvider._({
    required ProjectTripFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'projectTripProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectTripHash();

  @override
  String toString() {
    return r'projectTripProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ProjectedTrip> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectedTrip create(Ref ref) {
    final argument = this.argument as TripId;
    return projectTrip(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedTrip value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedTrip>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectTripProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectTripHash() => r'7dcd6d459aac845646163926437cf377a52ee6dd';

final class ProjectTripFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedTrip, TripId> {
  ProjectTripFamily._()
    : super(
        retry: null,
        name: r'projectTripProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProjectTripProvider call(TripId tripId) =>
      ProjectTripProvider._(argument: tripId, from: this);

  @override
  String toString() => r'projectTripProvider';
}

@ProviderFor(projectedExploreScene)
final projectedExploreSceneProvider = ProjectedExploreSceneProvider._();

final class ProjectedExploreSceneProvider
    extends $FunctionalProvider<ProjectedScene, ProjectedScene, ProjectedScene>
    with $Provider<ProjectedScene> {
  ProjectedExploreSceneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectedExploreSceneProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectedExploreSceneHash();

  @$internal
  @override
  $ProviderElement<ProjectedScene> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectedScene create(Ref ref) {
    return projectedExploreScene(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectedScene value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectedScene>(value),
    );
  }
}

String _$projectedExploreSceneHash() =>
    r'a354c160b812d9b46df8cc67f324105621af9705';

@ProviderFor(exploreScene)
final exploreSceneProvider = ExploreSceneProvider._();

final class ExploreSceneProvider
    extends $FunctionalProvider<MapScene, MapScene, MapScene>
    with $Provider<MapScene> {
  ExploreSceneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreSceneProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exploreSceneHash();

  @$internal
  @override
  $ProviderElement<MapScene> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapScene create(Ref ref) {
    return exploreScene(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapScene value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapScene>(value),
    );
  }
}

String _$exploreSceneHash() => r'09a18adcf46b1936aa2cac42b9dfd8515739e75c';
