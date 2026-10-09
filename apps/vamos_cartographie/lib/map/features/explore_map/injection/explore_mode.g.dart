// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapExplore)
final mapExploreProvider = MapExploreProvider._();

final class MapExploreProvider
    extends $NotifierProvider<MapExplore, ModeState<MapExploreMode>> {
  MapExploreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapExploreProvider',
        isAutoDispose: true,
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
  Override overrideWithValue(ModeState<MapExploreMode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeState<MapExploreMode>>(value),
    );
  }
}

String _$mapExploreHash() => r'226e436dadc8aa86f608b3f460ec4d1b974e0259';

abstract class _$MapExplore extends $Notifier<ModeState<MapExploreMode>> {
  ModeState<MapExploreMode> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<ModeState<MapExploreMode>, ModeState<MapExploreMode>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModeState<MapExploreMode>, ModeState<MapExploreMode>>,
              ModeState<MapExploreMode>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
