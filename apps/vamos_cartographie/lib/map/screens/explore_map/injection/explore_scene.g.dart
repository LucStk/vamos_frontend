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

  static final $allTransitiveDependencies0 = mapCameraHolderProvider;
  static final $allTransitiveDependencies1 =
      MapCameraHolderProvider.$allTransitiveDependencies0;

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

String _$projectTripHash() => r'1702b46f955d9582eae3b0d9b7d4d612cba06042';

final class ProjectTripFamily extends $Family
    with $FunctionalFamilyOverride<ProjectedTrip, TripId> {
  ProjectTripFamily._()
    : super(
        retry: null,
        name: r'projectTripProvider',
        dependencies: <ProviderOrFamily>[mapCameraHolderProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          ProjectTripProvider.$allTransitiveDependencies0,
          ProjectTripProvider.$allTransitiveDependencies1,
        ],
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
    extends
        $FunctionalProvider<
          List<ProjectedObject>,
          List<ProjectedObject>,
          List<ProjectedObject>
        >
    with $Provider<List<ProjectedObject>> {
  ProjectedExploreSceneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectedExploreSceneProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[
          userLocationProjectionProvider,
          projectTripProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          ProjectedExploreSceneProvider.$allTransitiveDependencies0,
          ProjectedExploreSceneProvider.$allTransitiveDependencies1,
          ProjectedExploreSceneProvider.$allTransitiveDependencies2,
          ProjectedExploreSceneProvider.$allTransitiveDependencies3,
        },
      );

  static final $allTransitiveDependencies0 = userLocationProjectionProvider;
  static final $allTransitiveDependencies1 =
      UserLocationProjectionProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      UserLocationProjectionProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 = projectTripProvider;

  @override
  String debugGetCreateSourceHash() => _$projectedExploreSceneHash();

  @$internal
  @override
  $ProviderElement<List<ProjectedObject>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedObject> create(Ref ref) {
    return projectedExploreScene(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedObject> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedObject>>(value),
    );
  }
}

String _$projectedExploreSceneHash() =>
    r'0bf90aaec15efb411af8e1ad2ac5dccb7abb55dd';

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
        dependencies: <ProviderOrFamily>[projectedExploreSceneProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          ExploreSceneProvider.$allTransitiveDependencies0,
          ExploreSceneProvider.$allTransitiveDependencies1,
          ExploreSceneProvider.$allTransitiveDependencies2,
          ExploreSceneProvider.$allTransitiveDependencies3,
          ExploreSceneProvider.$allTransitiveDependencies4,
        },
      );

  static final $allTransitiveDependencies0 = projectedExploreSceneProvider;
  static final $allTransitiveDependencies1 =
      ProjectedExploreSceneProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      ProjectedExploreSceneProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      ProjectedExploreSceneProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      ProjectedExploreSceneProvider.$allTransitiveDependencies3;

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

String _$exploreSceneHash() => r'a8f5e13c931e2240c1808a8a3016e3642a452e32';
