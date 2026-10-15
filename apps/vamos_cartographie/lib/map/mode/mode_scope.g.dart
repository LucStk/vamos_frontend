// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_scope.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(exploreScope)
final exploreScopeProvider = ExploreScopeProvider._();

final class ExploreScopeProvider
    extends $FunctionalProvider<ExploreScope, ExploreScope, ExploreScope>
    with $Provider<ExploreScope> {
  ExploreScopeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreScopeProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapCameraProvider,
          cameraDirectorProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          ExploreScopeProvider.$allTransitiveDependencies0,
          ExploreScopeProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;
  static final $allTransitiveDependencies1 = cameraDirectorProvider;

  @override
  String debugGetCreateSourceHash() => _$exploreScopeHash();

  @$internal
  @override
  $ProviderElement<ExploreScope> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ExploreScope create(Ref ref) {
    return exploreScope(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExploreScope value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExploreScope>(value),
    );
  }
}

String _$exploreScopeHash() => r'9a2be5f7a11198bd492a0750f61354f2a4ea582b';

@ProviderFor(tripEditScope)
final tripEditScopeProvider = TripEditScopeProvider._();

final class TripEditScopeProvider
    extends $FunctionalProvider<TripEditScope, TripEditScope, TripEditScope>
    with $Provider<TripEditScope> {
  TripEditScopeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripEditScopeProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapCameraProvider,
          cameraDirectorProvider,
          mapModeProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          TripEditScopeProvider.$allTransitiveDependencies0,
          TripEditScopeProvider.$allTransitiveDependencies1,
          TripEditScopeProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;
  static final $allTransitiveDependencies1 = cameraDirectorProvider;
  static final $allTransitiveDependencies2 = mapModeProvider;

  @override
  String debugGetCreateSourceHash() => _$tripEditScopeHash();

  @$internal
  @override
  $ProviderElement<TripEditScope> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripEditScope create(Ref ref) {
    return tripEditScope(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripEditScope value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripEditScope>(value),
    );
  }
}

String _$tripEditScopeHash() => r'a0ad57198e68da8cbac29401092dc276267a23dd';

@ProviderFor(handlerRegistry)
final handlerRegistryProvider = HandlerRegistryProvider._();

final class HandlerRegistryProvider
    extends
        $FunctionalProvider<HandlerRegistry, HandlerRegistry, HandlerRegistry>
    with $Provider<HandlerRegistry> {
  HandlerRegistryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'handlerRegistryProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapModeProvider,
          exploreScopeProvider,
          tripEditScopeProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          HandlerRegistryProvider.$allTransitiveDependencies0,
          HandlerRegistryProvider.$allTransitiveDependencies1,
          HandlerRegistryProvider.$allTransitiveDependencies2,
          HandlerRegistryProvider.$allTransitiveDependencies3,
          HandlerRegistryProvider.$allTransitiveDependencies4,
        },
      );

  static final $allTransitiveDependencies0 = mapModeProvider;
  static final $allTransitiveDependencies1 = exploreScopeProvider;
  static final $allTransitiveDependencies2 =
      ExploreScopeProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies3 =
      ExploreScopeProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies4 = tripEditScopeProvider;

  @override
  String debugGetCreateSourceHash() => _$handlerRegistryHash();

  @$internal
  @override
  $ProviderElement<HandlerRegistry> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HandlerRegistry create(Ref ref) {
    return handlerRegistry(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HandlerRegistry value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HandlerRegistry>(value),
    );
  }
}

String _$handlerRegistryHash() => r'25d13c7c3f929d6964c89289694f147816aff288';
