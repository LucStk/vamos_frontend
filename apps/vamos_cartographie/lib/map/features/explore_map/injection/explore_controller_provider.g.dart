// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapExplore)
final mapExploreProvider = MapExploreProvider._();

final class MapExploreProvider
    extends $NotifierProvider<MapExplore, MapExploreMode> {
  MapExploreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapExploreProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapCameraProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapExploreProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;

  @override
  String debugGetCreateSourceHash() => _$mapExploreHash();

  @$internal
  @override
  MapExplore create() => MapExplore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapExploreMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapExploreMode>(value),
    );
  }
}

String _$mapExploreHash() => r'9b576e24ebaa54417cebc911e53f77bc378d7827';

abstract class _$MapExplore extends $Notifier<MapExploreMode> {
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
