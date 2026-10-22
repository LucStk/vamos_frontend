// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_scope.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
          tripCreateScopeProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          HandlerRegistryProvider.$allTransitiveDependencies0,
          HandlerRegistryProvider.$allTransitiveDependencies1,
          HandlerRegistryProvider.$allTransitiveDependencies2,
          HandlerRegistryProvider.$allTransitiveDependencies3,
          HandlerRegistryProvider.$allTransitiveDependencies4,
          HandlerRegistryProvider.$allTransitiveDependencies5,
        },
      );

  static final $allTransitiveDependencies0 = mapModeProvider;
  static final $allTransitiveDependencies1 = exploreScopeProvider;
  static final $allTransitiveDependencies2 =
      ExploreScopeProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies3 =
      ExploreScopeProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies4 = tripEditScopeProvider;
  static final $allTransitiveDependencies5 = tripCreateScopeProvider;

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

String _$handlerRegistryHash() => r'abfbc9501e62661552c2cf246d9b7738ecec8da4';

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

String _$tripEditScopeHash() => r'6313793b09865da7617eba36e2f985e5820e4d1b';

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

@ProviderFor(tripCreateScope)
final tripCreateScopeProvider = TripCreateScopeProvider._();

final class TripCreateScopeProvider
    extends
        $FunctionalProvider<TripCreateScope, TripCreateScope, TripCreateScope>
    with $Provider<TripCreateScope> {
  TripCreateScopeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripCreateScopeProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapCameraProvider,
          cameraDirectorProvider,
          mapModeProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          TripCreateScopeProvider.$allTransitiveDependencies0,
          TripCreateScopeProvider.$allTransitiveDependencies1,
          TripCreateScopeProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;
  static final $allTransitiveDependencies1 = cameraDirectorProvider;
  static final $allTransitiveDependencies2 = mapModeProvider;

  @override
  String debugGetCreateSourceHash() => _$tripCreateScopeHash();

  @$internal
  @override
  $ProviderElement<TripCreateScope> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripCreateScope create(Ref ref) {
    return tripCreateScope(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripCreateScope value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripCreateScope>(value),
    );
  }
}

String _$tripCreateScopeHash() => r'f7688d70a1944f69bae64c61fc383bca92d748fb';
