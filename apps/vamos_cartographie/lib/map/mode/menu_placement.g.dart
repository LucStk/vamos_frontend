// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_placement.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(menuPlacement)
final menuPlacementProvider = MenuPlacementFamily._();

final class MenuPlacementProvider
    extends $FunctionalProvider<MenuPlacement?, MenuPlacement?, MenuPlacement?>
    with $Provider<MenuPlacement?> {
  MenuPlacementProvider._({
    required MenuPlacementFamily super.from,
    required MapCameraController super.argument,
  }) : super(
         retry: null,
         name: r'menuPlacementProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = modeOverlayProvider;
  static final $allTransitiveDependencies1 = vertexItemProvider;
  static final $allTransitiveDependencies2 =
      VertexItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies3 = pencilItemProvider;

  @override
  String debugGetCreateSourceHash() => _$menuPlacementHash();

  @override
  String toString() {
    return r'menuPlacementProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MenuPlacement?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MenuPlacement? create(Ref ref) {
    final argument = this.argument as MapCameraController;
    return menuPlacement(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MenuPlacement? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MenuPlacement?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MenuPlacementProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$menuPlacementHash() => r'e0d9c21539809666dce6a7b15027155e563d1697';

final class MenuPlacementFamily extends $Family
    with $FunctionalFamilyOverride<MenuPlacement?, MapCameraController> {
  MenuPlacementFamily._()
    : super(
        retry: null,
        name: r'menuPlacementProvider',
        dependencies: <ProviderOrFamily>[
          modeOverlayProvider,
          vertexItemProvider,
          pencilItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          MenuPlacementProvider.$allTransitiveDependencies0,
          MenuPlacementProvider.$allTransitiveDependencies1,
          MenuPlacementProvider.$allTransitiveDependencies2,
          MenuPlacementProvider.$allTransitiveDependencies3,
        },
        isAutoDispose: false,
      );

  MenuPlacementProvider call(MapCameraController camera) =>
      MenuPlacementProvider._(argument: camera, from: this);

  @override
  String toString() => r'menuPlacementProvider';
}
