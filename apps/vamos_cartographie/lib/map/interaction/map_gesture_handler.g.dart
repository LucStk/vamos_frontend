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
          modeMachineProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies0,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies1,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies2,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies3,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies4,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies5,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies6,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies7,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies8,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies9,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies10,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies11,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies12,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies13,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies14,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies15,
          MapGestureHandlerNotifierProvider.$allTransitiveDependencies16,
        },
      );

  static final $allTransitiveDependencies0 = mapSceneProvider;
  static final $allTransitiveDependencies1 =
      MapSceneProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      MapSceneProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      MapSceneProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      MapSceneProvider.$allTransitiveDependencies3;
  static final $allTransitiveDependencies5 =
      MapSceneProvider.$allTransitiveDependencies4;
  static final $allTransitiveDependencies6 =
      MapSceneProvider.$allTransitiveDependencies5;
  static final $allTransitiveDependencies7 =
      MapSceneProvider.$allTransitiveDependencies6;
  static final $allTransitiveDependencies8 =
      MapSceneProvider.$allTransitiveDependencies7;
  static final $allTransitiveDependencies9 =
      MapSceneProvider.$allTransitiveDependencies8;
  static final $allTransitiveDependencies10 =
      MapSceneProvider.$allTransitiveDependencies9;
  static final $allTransitiveDependencies11 =
      MapSceneProvider.$allTransitiveDependencies10;
  static final $allTransitiveDependencies12 =
      MapSceneProvider.$allTransitiveDependencies11;
  static final $allTransitiveDependencies13 = mapCameraProvider;
  static final $allTransitiveDependencies14 = modeMachineProvider;
  static final $allTransitiveDependencies15 =
      ModeMachineProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies16 =
      ModeMachineProvider.$allTransitiveDependencies3;

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
    r'5f8dc7711a4fb7f51f1db17a872e794a2f325a08';

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
