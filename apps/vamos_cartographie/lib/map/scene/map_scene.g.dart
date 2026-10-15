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
  static final $allTransitiveDependencies1 = allTripItemProvider;
  static final $allTransitiveDependencies2 =
      AllTripItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies3 = localizationItemProvider;
  static final $allTransitiveDependencies4 = allSketchItemProvider;
  static final $allTransitiveDependencies5 =
      AllSketchItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies6 =
      AllSketchItemProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies7 = allSegmentItemProvider;
  static final $allTransitiveDependencies8 =
      AllSegmentItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies9 = allVertexItemProvider;
  static final $allTransitiveDependencies10 =
      AllVertexItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies11 =
      AllVertexItemProvider.$allTransitiveDependencies1;

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

String _$sceneItemsHash() => r'0841cf9c7891fd8b4003dcd0fe0f3555576b7e02';

final class SceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraController> {
  SceneItemsFamily._()
    : super(
        retry: null,
        name: r'sceneItemsProvider',
        dependencies: <ProviderOrFamily>[
          mapModeProvider,
          allTripItemProvider,
          localizationItemProvider,
          allSketchItemProvider,
          allSegmentItemProvider,
          allVertexItemProvider,
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
          SceneItemsProvider.$allTransitiveDependencies10,
          SceneItemsProvider.$allTransitiveDependencies11,
        },
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
        dependencies: <ProviderOrFamily>[
          cameraOrNullProvider,
          sceneItemsProvider,
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
          MapSceneProvider.$allTransitiveDependencies12,
          MapSceneProvider.$allTransitiveDependencies13,
        },
      );

  static final $allTransitiveDependencies0 = cameraOrNullProvider;
  static final $allTransitiveDependencies1 = sceneItemsProvider;
  static final $allTransitiveDependencies2 =
      SceneItemsProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies3 =
      SceneItemsProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies4 =
      SceneItemsProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies5 =
      SceneItemsProvider.$allTransitiveDependencies3;
  static final $allTransitiveDependencies6 =
      SceneItemsProvider.$allTransitiveDependencies4;
  static final $allTransitiveDependencies7 =
      SceneItemsProvider.$allTransitiveDependencies5;
  static final $allTransitiveDependencies8 =
      SceneItemsProvider.$allTransitiveDependencies6;
  static final $allTransitiveDependencies9 =
      SceneItemsProvider.$allTransitiveDependencies7;
  static final $allTransitiveDependencies10 =
      SceneItemsProvider.$allTransitiveDependencies8;
  static final $allTransitiveDependencies11 =
      SceneItemsProvider.$allTransitiveDependencies9;
  static final $allTransitiveDependencies12 =
      SceneItemsProvider.$allTransitiveDependencies10;
  static final $allTransitiveDependencies13 =
      SceneItemsProvider.$allTransitiveDependencies11;

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

String _$mapSceneHash() => r'f5afb2bcc9dfd3bee33912d19d1b5fc182f8e5b4';
