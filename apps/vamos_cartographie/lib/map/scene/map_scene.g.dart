// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_scene.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Items de la scène, en coordonnées MONDE.
///
/// La caméra n'est qu'une clé de famille : la projection monde est fixe
/// (`referenceZoom`), donc les items ne dépendent pas de l'état de la vue
/// (pan, zoom, rotation). Ce provider ne se recalcule pas quand la caméra
/// bouge ; c'est `CameraTransform` qui applique la matrice de vue.

@ProviderFor(sceneItems)
final sceneItemsProvider = SceneItemsFamily._();

/// Items de la scène, en coordonnées MONDE.
///
/// La caméra n'est qu'une clé de famille : la projection monde est fixe
/// (`referenceZoom`), donc les items ne dépendent pas de l'état de la vue
/// (pan, zoom, rotation). Ce provider ne se recalcule pas quand la caméra
/// bouge ; c'est `CameraTransform` qui applique la matrice de vue.

final class SceneItemsProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  /// Items de la scène, en coordonnées MONDE.
  ///
  /// La caméra n'est qu'une clé de famille : la projection monde est fixe
  /// (`referenceZoom`), donc les items ne dépendent pas de l'état de la vue
  /// (pan, zoom, rotation). Ce provider ne se recalcule pas quand la caméra
  /// bouge ; c'est `CameraTransform` qui applique la matrice de vue.
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
  static final $allTransitiveDependencies1 = localizationItemProvider;
  static final $allTransitiveDependencies2 = allSketchItemProvider;
  static final $allTransitiveDependencies3 =
      AllSketchItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies4 =
      AllSketchItemProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies5 = allSegmentItemProvider;
  static final $allTransitiveDependencies6 =
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

String _$sceneItemsHash() => r'b1407ffa94b33ba15dbfcebd50cad52c8fd5be4b';

/// Items de la scène, en coordonnées MONDE.
///
/// La caméra n'est qu'une clé de famille : la projection monde est fixe
/// (`referenceZoom`), donc les items ne dépendent pas de l'état de la vue
/// (pan, zoom, rotation). Ce provider ne se recalcule pas quand la caméra
/// bouge ; c'est `CameraTransform` qui applique la matrice de vue.

final class SceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraController> {
  SceneItemsFamily._()
    : super(
        retry: null,
        name: r'sceneItemsProvider',
        dependencies: <ProviderOrFamily>[
          mapModeProvider,
          localizationItemProvider,
          allSketchItemProvider,
          allSegmentItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          SceneItemsProvider.$allTransitiveDependencies0,
          SceneItemsProvider.$allTransitiveDependencies1,
          SceneItemsProvider.$allTransitiveDependencies2,
          SceneItemsProvider.$allTransitiveDependencies3,
          SceneItemsProvider.$allTransitiveDependencies4,
          SceneItemsProvider.$allTransitiveDependencies5,
          SceneItemsProvider.$allTransitiveDependencies6,
        },
        isAutoDispose: false,
      );

  /// Items de la scène, en coordonnées MONDE.
  ///
  /// La caméra n'est qu'une clé de famille : la projection monde est fixe
  /// (`referenceZoom`), donc les items ne dépendent pas de l'état de la vue
  /// (pan, zoom, rotation). Ce provider ne se recalcule pas quand la caméra
  /// bouge ; c'est `CameraTransform` qui applique la matrice de vue.

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
          cameraOrNullProvider,
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
  static final $allTransitiveDependencies8 = cameraOrNullProvider;
  static final $allTransitiveDependencies9 =
      CameraOrNullProvider.$allTransitiveDependencies0;

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

String _$mapSceneHash() => r'9889b329e76229ccf85d93b1b73bd3b6468e376c';
