// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_scene.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'b6186f8fbdd65410e290eaa575a04289761ab262';

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

String _$exploreSceneHash() => r'f88895d29de0a39350c2f43d05efb25c546b87df';
