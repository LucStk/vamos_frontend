// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapExploreController)
final mapExploreControllerProvider = MapExploreControllerProvider._();

final class MapExploreControllerProvider
    extends
        $FunctionalProvider<
          MapExploreController,
          MapExploreController,
          MapExploreController
        >
    with $Provider<MapExploreController> {
  MapExploreControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapExploreControllerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapCameraHolderProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapExploreControllerProvider.$allTransitiveDependencies0,
          MapExploreControllerProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraHolderProvider;
  static final $allTransitiveDependencies1 =
      MapCameraHolderProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$mapExploreControllerHash();

  @$internal
  @override
  $ProviderElement<MapExploreController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapExploreController create(Ref ref) {
    return mapExploreController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapExploreController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapExploreController>(value),
    );
  }
}

String _$mapExploreControllerHash() =>
    r'7e9e99fadbd80a9a7915ad2a5c241530b28aefae';

@ProviderFor(ExploreModeNotifier)
final exploreModeProvider = ExploreModeNotifierProvider._();

final class ExploreModeNotifierProvider
    extends $NotifierProvider<ExploreModeNotifier, MapExploreMode> {
  ExploreModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exploreModeNotifierHash();

  @$internal
  @override
  ExploreModeNotifier create() => ExploreModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapExploreMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapExploreMode>(value),
    );
  }
}

String _$exploreModeNotifierHash() =>
    r'96ad5baf56d2f105d8fb1112e1915e2005731cce';

abstract class _$ExploreModeNotifier extends $Notifier<MapExploreMode> {
  MapExploreMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapExploreMode, MapExploreMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapExploreMode, MapExploreMode>,
              MapExploreMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
