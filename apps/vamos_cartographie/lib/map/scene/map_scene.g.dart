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

  static final $allTransitiveDependencies0 = sketchTraceItemProvider;
  static final $allTransitiveDependencies1 = pencilItemProvider;
  static final $allTransitiveDependencies2 = mapModeProvider;
  static final $allTransitiveDependencies3 = allSegmentItemProvider;
  static final $allTransitiveDependencies4 =
      AllSegmentItemProvider.$allTransitiveDependencies0;

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

String _$sceneItemsHash() => r'1b833705430478a94bf683ea089e40b513b1e129';

final class SceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraController> {
  SceneItemsFamily._()
    : super(
        retry: null,
        name: r'sceneItemsProvider',
        dependencies: <ProviderOrFamily>[
          sketchTraceItemProvider,
          pencilItemProvider,
          mapModeProvider,
          allSegmentItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          SceneItemsProvider.$allTransitiveDependencies0,
          SceneItemsProvider.$allTransitiveDependencies1,
          SceneItemsProvider.$allTransitiveDependencies2,
          SceneItemsProvider.$allTransitiveDependencies3,
          SceneItemsProvider.$allTransitiveDependencies4,
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
        dependencies: <ProviderOrFamily>[sceneItemsProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          MapSceneProvider.$allTransitiveDependencies0,
          MapSceneProvider.$allTransitiveDependencies1,
          MapSceneProvider.$allTransitiveDependencies2,
          MapSceneProvider.$allTransitiveDependencies3,
          MapSceneProvider.$allTransitiveDependencies4,
          MapSceneProvider.$allTransitiveDependencies5,
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

String _$mapSceneHash() => r'1a2807521591c8a37659e184acb2eee019505505';
