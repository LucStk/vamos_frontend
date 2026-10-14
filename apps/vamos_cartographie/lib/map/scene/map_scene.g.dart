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

  static final $allTransitiveDependencies0 = mapModeProvider;

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

String _$sceneItemsHash() => r'f565e52191b9353491a1ce6729d075abd0d0c8be';

final class SceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraController> {
  SceneItemsFamily._()
    : super(
        retry: null,
        name: r'sceneItemsProvider',
        dependencies: <ProviderOrFamily>[mapModeProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          SceneItemsProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: false,
      );

  SceneItemsProvider call(MapCameraController camera) =>
      SceneItemsProvider._(argument: camera, from: this);

  @override
  String toString() => r'sceneItemsProvider';
}

@ProviderFor(mapScene)
final mapSceneProvider = MapSceneProvider._();

final class MapSceneProvider
    extends $FunctionalProvider<MapScene, MapScene, MapScene>
    with $Provider<MapScene> {
  MapSceneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapSceneProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapModeProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapSceneProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapModeProvider;

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

String _$mapSceneHash() => r'04ebaa1de4c276346d4a01b8367cb5b4869af5a1';
