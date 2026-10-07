// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_gesture_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).

@ProviderFor(MapGestureHandlerNotifier)
final mapGestureHandlerProvider = MapGestureHandlerNotifierProvider._();

/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).
final class MapGestureHandlerNotifierProvider
    extends $NotifierProvider<MapGestureHandlerNotifier, bool> {
  /// State : `true` tant que la carte peut être pannée
  /// (`false` pendant le drag d'un objet).
  MapGestureHandlerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapGestureHandlerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapSceneProvider,
          mapCameraProvider,
          mapModeControllerProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies0,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies1,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = mapSceneProvider;
  static final $allTransitiveDependencies1 = mapCameraProvider;
  static final $allTransitiveDependencies2 = mapModeControllerProvider;

  @override
  String debugGetCreateSourceHash() => _$mapGestureHandlerNotifierHash();

  @$internal
  @override
  MapGestureHandlerNotifier create() => MapGestureHandlerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$mapGestureHandlerNotifierHash() =>
    r'a4348f12b8b91bd6e4a23460deafd63a4f5a9e96';

/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).

abstract class _$MapGestureHandlerNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
