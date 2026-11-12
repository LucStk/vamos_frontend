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

  static final $allTransitiveDependencies0 = searchResultItemProvider;
  static final $allTransitiveDependencies1 =
      SearchResultItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      SearchResultItemProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 = pendingWaypointProvider;
  static final $allTransitiveDependencies4 = spanBoundHandleItemsProvider;
  static final $allTransitiveDependencies5 = selectionHandleItemsProvider;
  static final $allTransitiveDependencies6 = pencilItemProvider;
  static final $allTransitiveDependencies7 = sketchTraceItemProvider;
  static final $allTransitiveDependencies8 = sketchOriginItemProvider;
  static final $allTransitiveDependencies9 = sketchEndItemProvider;
  static final $allTransitiveDependencies10 = tmpOriginItemProvider;
  static final $allTransitiveDependencies11 = mapModeProvider;

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

String _$sceneItemsHash() => r'ea1046b7045df332fb21fe8212799385c367e40f';

final class SceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraController> {
  SceneItemsFamily._()
    : super(
        retry: null,
        name: r'sceneItemsProvider',
        dependencies: <ProviderOrFamily>[
          searchResultItemProvider,
          pendingWaypointProvider,
          spanBoundHandleItemsProvider,
          selectionHandleItemsProvider,
          pencilItemProvider,
          sketchTraceItemProvider,
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

/// Traits de la scène : sélection globale du mode, plus la mise en avant
/// déclarée par la scène courante. Séparé de [sceneItems] pour qu'un
/// changement de sélection ne reconstruise pas la liste des items.

@ProviderFor(sceneTraits)
final sceneTraitsProvider = SceneTraitsFamily._();

/// Traits de la scène : sélection globale du mode, plus la mise en avant
/// déclarée par la scène courante. Séparé de [sceneItems] pour qu'un
/// changement de sélection ne reconstruise pas la liste des items.

final class SceneTraitsProvider
    extends
        $FunctionalProvider<
          Map<Object, Set<VisualTrait>>,
          Map<Object, Set<VisualTrait>>,
          Map<Object, Set<VisualTrait>>
        >
    with $Provider<Map<Object, Set<VisualTrait>>> {
  /// Traits de la scène : sélection globale du mode, plus la mise en avant
  /// déclarée par la scène courante. Séparé de [sceneItems] pour qu'un
  /// changement de sélection ne reconstruise pas la liste des items.
  SceneTraitsProvider._({
    required SceneTraitsFamily super.from,
    required MapCameraController super.argument,
  }) : super(
         retry: null,
         name: r'sceneTraitsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = searchResultItemProvider;
  static final $allTransitiveDependencies1 =
      SearchResultItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      SearchResultItemProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 = pendingWaypointProvider;
  static final $allTransitiveDependencies4 = spanBoundHandleItemsProvider;
  static final $allTransitiveDependencies5 = selectionHandleItemsProvider;
  static final $allTransitiveDependencies6 = pencilItemProvider;
  static final $allTransitiveDependencies7 = sketchTraceItemProvider;
  static final $allTransitiveDependencies8 = sketchOriginItemProvider;
  static final $allTransitiveDependencies9 = sketchEndItemProvider;
  static final $allTransitiveDependencies10 = tmpOriginItemProvider;
  static final $allTransitiveDependencies11 = mapModeProvider;
  static final $allTransitiveDependencies12 = modeSelectionProvider;

  @override
  String debugGetCreateSourceHash() => _$sceneTraitsHash();

  @override
  String toString() {
    return r'sceneTraitsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<Object, Set<VisualTrait>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<Object, Set<VisualTrait>> create(Ref ref) {
    final argument = this.argument as MapCameraController;
    return sceneTraits(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<Object, Set<VisualTrait>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<Object, Set<VisualTrait>>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SceneTraitsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sceneTraitsHash() => r'345bf1ce259f013b6df9f0e7b488f3bd58412c6a';

/// Traits de la scène : sélection globale du mode, plus la mise en avant
/// déclarée par la scène courante. Séparé de [sceneItems] pour qu'un
/// changement de sélection ne reconstruise pas la liste des items.

final class SceneTraitsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Map<Object, Set<VisualTrait>>,
          MapCameraController
        > {
  SceneTraitsFamily._()
    : super(
        retry: null,
        name: r'sceneTraitsProvider',
        dependencies: <ProviderOrFamily>[
          searchResultItemProvider,
          pendingWaypointProvider,
          spanBoundHandleItemsProvider,
          selectionHandleItemsProvider,
          pencilItemProvider,
          sketchTraceItemProvider,
          sketchOriginItemProvider,
          sketchEndItemProvider,
          tmpOriginItemProvider,
          mapModeProvider,
          modeSelectionProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          SceneTraitsProvider.$allTransitiveDependencies0,
          SceneTraitsProvider.$allTransitiveDependencies1,
          SceneTraitsProvider.$allTransitiveDependencies2,
          SceneTraitsProvider.$allTransitiveDependencies3,
          SceneTraitsProvider.$allTransitiveDependencies4,
          SceneTraitsProvider.$allTransitiveDependencies5,
          SceneTraitsProvider.$allTransitiveDependencies6,
          SceneTraitsProvider.$allTransitiveDependencies7,
          SceneTraitsProvider.$allTransitiveDependencies8,
          SceneTraitsProvider.$allTransitiveDependencies9,
          SceneTraitsProvider.$allTransitiveDependencies10,
          SceneTraitsProvider.$allTransitiveDependencies11,
          SceneTraitsProvider.$allTransitiveDependencies12,
        },
        isAutoDispose: false,
      );

  /// Traits de la scène : sélection globale du mode, plus la mise en avant
  /// déclarée par la scène courante. Séparé de [sceneItems] pour qu'un
  /// changement de sélection ne reconstruise pas la liste des items.

  SceneTraitsProvider call(MapCameraController camera) =>
      SceneTraitsProvider._(argument: camera, from: this);

  @override
  String toString() => r'sceneTraitsProvider';
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
          sceneTraitsProvider,
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
          MapSceneProvider.$allTransitiveDependencies14,
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
  static final $allTransitiveDependencies11 =
      SceneItemsProvider.$allTransitiveDependencies10;
  static final $allTransitiveDependencies12 =
      SceneItemsProvider.$allTransitiveDependencies11;
  static final $allTransitiveDependencies13 = sceneTraitsProvider;
  static final $allTransitiveDependencies14 =
      SceneTraitsProvider.$allTransitiveDependencies12;

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

String _$mapSceneHash() => r'8b16568f580aa4eeefb2430c54d7d71f206cc885';
