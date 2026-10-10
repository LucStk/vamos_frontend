// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_scene.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(exploreSceneItems)
final exploreSceneItemsProvider = ExploreSceneItemsProvider._();

final class ExploreSceneItemsProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  ExploreSceneItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreSceneItemsProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[
          cameraOrNullProvider,
          localizationItemProvider,
          tripItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          ExploreSceneItemsProvider.$allTransitiveDependencies0,
          ExploreSceneItemsProvider.$allTransitiveDependencies1,
          ExploreSceneItemsProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = cameraOrNullProvider;
  static final $allTransitiveDependencies1 = localizationItemProvider;
  static final $allTransitiveDependencies2 = tripItemProvider;

  @override
  String debugGetCreateSourceHash() => _$exploreSceneItemsHash();

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    return exploreSceneItems(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SceneItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SceneItem>>(value),
    );
  }
}

String _$exploreSceneItemsHash() => r'd02c8613022748db895467bd3c7c3e077efe6337';

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
        dependencies: <ProviderOrFamily>[
          exploreSceneItemsProvider,
          modeContextProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          ExploreSceneProvider.$allTransitiveDependencies0,
          ExploreSceneProvider.$allTransitiveDependencies1,
          ExploreSceneProvider.$allTransitiveDependencies2,
          ExploreSceneProvider.$allTransitiveDependencies3,
          ExploreSceneProvider.$allTransitiveDependencies4,
        },
      );

  static final $allTransitiveDependencies0 = exploreSceneItemsProvider;
  static final $allTransitiveDependencies1 =
      ExploreSceneItemsProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      ExploreSceneItemsProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      ExploreSceneItemsProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 = modeContextProvider;

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

String _$exploreSceneHash() => r'dc733810e2ae8bb87e77f154b09621b0761721dc';
