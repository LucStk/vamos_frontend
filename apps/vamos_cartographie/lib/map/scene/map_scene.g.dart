// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_scene.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sceneItems)
final sceneItemsProvider = SceneItemsFamily._();

final class SceneItemsProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  SceneItemsProvider._({
    required SceneItemsFamily super.from,
    required MapCameraController super.argument,
  }) : super(
         retry: null,
         name: r'sceneItemsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = pencilItemProvider;
  static final $allTransitiveDependencies1 =
      PencilItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      PencilItemProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 = sketchTraceItemProvider;
  static final $allTransitiveDependencies4 = allSegmentItemProvider;
  static final $allTransitiveDependencies5 =
      AllSegmentItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies6 = sketchOriginItemProvider;
  static final $allTransitiveDependencies7 = sketchEndItemProvider;
  static final $allTransitiveDependencies8 = tmpOriginItemProvider;
  static final $allTransitiveDependencies9 = mapModeProvider;

  @override
  String debugGetCreateSourceHash() => _$sceneItemsHash();

  @override
  String toString() {
    return r'sceneItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as MapCameraController;
    return sceneItems(ref, argument);
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
    return other is SceneItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sceneItemsHash() => r'bcff9b7ee17d8da47ed2b9c22a29054e1853061f';

final class SceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraController> {
  SceneItemsFamily._()
    : super(
        retry: null,
        name: r'sceneItemsProvider',
        dependencies: <ProviderOrFamily>[
          pencilItemProvider,
          sketchTraceItemProvider,
          allSegmentItemProvider,
          sketchOriginItemProvider,
          sketchEndItemProvider,
          tmpOriginItemProvider,
          mapModeProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          SceneItemsProvider.$allTransitiveDependencies0,
          SceneItemsProvider.$allTransitiveDependencies1,
          SceneItemsProvider.$allTransitiveDependencies2,
          SceneItemsProvider.$allTransitiveDependencies3,
          SceneItemsProvider.$allTransitiveDependencies4,
          SceneItemsProvider.$allTransitiveDependencies5,
          SceneItemsProvider.$allTransitiveDependencies6,
          SceneItemsProvider.$allTransitiveDependencies7,
          SceneItemsProvider.$allTransitiveDependencies8,
          SceneItemsProvider.$allTransitiveDependencies9,
        },
        isAutoDispose: false,
      );

  SceneItemsProvider call(MapCameraController camera) =>
      SceneItemsProvider._(argument: camera, from: this);

  @override
  String toString() => r'sceneItemsProvider';
}

/// Scène courante. Vide tant que la carte n'est pas montée : `cameraOrNull`
/// vaut alors `null`, et `latLngToWorldOffset` (appelé par les items) lèverait
/// une exception.

@ProviderFor(mapScene)
final mapSceneProvider = MapSceneProvider._();

/// Scène courante. Vide tant que la carte n'est pas montée : `cameraOrNull`
/// vaut alors `null`, et `latLngToWorldOffset` (appelé par les items) lèverait
/// une exception.

final class MapSceneProvider
    extends $FunctionalProvider<MapScene, MapScene, MapScene>
    with $Provider<MapScene> {
  /// Scène courante. Vide tant que la carte n'est pas montée : `cameraOrNull`
  /// vaut alors `null`, et `latLngToWorldOffset` (appelé par les items) lèverait
  /// une exception.
  MapSceneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapSceneProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          sceneItemsProvider,
          modeSelectionProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          MapSceneProvider.$allTransitiveDependencies0,
          MapSceneProvider.$allTransitiveDependencies1,
          MapSceneProvider.$allTransitiveDependencies2,
          MapSceneProvider.$allTransitiveDependencies3,
          MapSceneProvider.$allTransitiveDependencies4,
          MapSceneProvider.$allTransitiveDependencies5,
          MapSceneProvider.$allTransitiveDependencies6,
          MapSceneProvider.$allTransitiveDependencies7,
          MapSceneProvider.$allTransitiveDependencies8,
          MapSceneProvider.$allTransitiveDependencies9,
          MapSceneProvider.$allTransitiveDependencies10,
          MapSceneProvider.$allTransitiveDependencies11,
        },
      );

  static final $allTransitiveDependencies0 = sceneItemsProvider;
  static final $allTransitiveDependencies1 =
      SceneItemsProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      SceneItemsProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      SceneItemsProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      SceneItemsProvider.$allTransitiveDependencies3;
  static final $allTransitiveDependencies5 =
      SceneItemsProvider.$allTransitiveDependencies4;
  static final $allTransitiveDependencies6 =
      SceneItemsProvider.$allTransitiveDependencies5;
  static final $allTransitiveDependencies7 =
      SceneItemsProvider.$allTransitiveDependencies6;
  static final $allTransitiveDependencies8 =
      SceneItemsProvider.$allTransitiveDependencies7;
  static final $allTransitiveDependencies9 =
      SceneItemsProvider.$allTransitiveDependencies8;
  static final $allTransitiveDependencies10 =
      SceneItemsProvider.$allTransitiveDependencies9;
  static final $allTransitiveDependencies11 = modeSelectionProvider;

  @override
  String debugGetCreateSourceHash() => _$mapSceneHash();

  @$internal
  @override
  $ProviderElement<MapScene> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapScene create(Ref ref) {
    return mapScene(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapScene value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapScene>(value),
    );
  }
}

String _$mapSceneHash() => r'6c6c8f50891974691f5a486b5c613f4392d4990d';
