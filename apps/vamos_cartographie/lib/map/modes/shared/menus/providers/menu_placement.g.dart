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
          modeOverlayProvider,
          pencilItemProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MenuPlacementProvider.$allTransitiveDependencies0,
          MenuPlacementProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = modeOverlayProvider;
  static final $allTransitiveDependencies1 = pencilItemProvider;

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

String _$menuPlacementHash() => r'b6b80adb0764d87bbd34417796e1d7993025cb8b';
