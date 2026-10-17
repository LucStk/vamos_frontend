// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_placement.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(menuPlacement)
final menuPlacementProvider = MenuPlacementProvider._();

final class MenuPlacementProvider
    extends $FunctionalProvider<MenuPlacement?, MenuPlacement?, MenuPlacement?>
    with $Provider<MenuPlacement?> {
  MenuPlacementProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuPlacementProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          cameraOrNullProvider,
          modeOverlayProvider,
          vertexItemProvider,
          pencilItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          MenuPlacementProvider.$allTransitiveDependencies0,
          MenuPlacementProvider.$allTransitiveDependencies1,
          MenuPlacementProvider.$allTransitiveDependencies2,
          MenuPlacementProvider.$allTransitiveDependencies3,
          MenuPlacementProvider.$allTransitiveDependencies4,
          MenuPlacementProvider.$allTransitiveDependencies5,
        },
      );

  static final $allTransitiveDependencies0 = cameraOrNullProvider;
  static final $allTransitiveDependencies1 =
      CameraOrNullProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 = modeOverlayProvider;
  static final $allTransitiveDependencies3 = vertexItemProvider;
  static final $allTransitiveDependencies4 =
      VertexItemProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies5 = pencilItemProvider;

  @override
  String debugGetCreateSourceHash() => _$menuPlacementHash();

  @$internal
  @override
  $ProviderElement<MenuPlacement?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MenuPlacement? create(Ref ref) {
    return menuPlacement(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MenuPlacement? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MenuPlacement?>(value),
    );
  }
}

String _$menuPlacementHash() => r'6ff224d32ff063031a35684a34b22d9aec8cce06';
