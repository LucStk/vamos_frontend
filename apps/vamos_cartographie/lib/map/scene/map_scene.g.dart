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

String _$sceneItemsHash() => r'f96bdc72346f7610e9151d1b494024faf30eaa88';

final class SceneItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, MapCameraController> {
  SceneItemsFamily._()
    : super(
        retry: null,
        name: r'sceneItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
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

String _$sceneTraitsHash() => r'a111cc0730f4879e0144a1747119d470604c0a11';

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
        dependencies: null,
        $allTransitiveDependencies: null,
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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$mapSceneHash() => r'086dfda8db60aef81169d5113ea2d23b3f46083f';
