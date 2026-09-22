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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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
    r'343b28567ed7831f46efcd57b80afa05f2c4d4d6';

@ProviderFor(ExploreModeNotifier)
final exploreModeProvider = ExploreModeNotifierProvider._();

final class ExploreModeNotifierProvider
    extends
        $NotifierProvider<ExploreModeNotifier, BaseMode<BaseMode<dynamic>>> {
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
  Override overrideWithValue(BaseMode<BaseMode<dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseMode<BaseMode<dynamic>>>(value),
    );
  }
}

String _$exploreModeNotifierHash() =>
    r'59cecd2b6826c97ab51a2cf6acba974ce0412cb4';

abstract class _$ExploreModeNotifier
    extends $Notifier<BaseMode<BaseMode<dynamic>>> {
  BaseMode<BaseMode<dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<BaseMode<BaseMode<dynamic>>, BaseMode<BaseMode<dynamic>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                BaseMode<BaseMode<dynamic>>,
                BaseMode<BaseMode<dynamic>>
              >,
              BaseMode<BaseMode<dynamic>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
