// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_hit_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapController)
final mapControllerProvider = MapControllerProvider._();

final class MapControllerProvider
    extends $FunctionalProvider<MapController, MapController, MapController>
    with $Provider<MapController> {
  MapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @$internal
  @override
  $ProviderElement<MapController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapController create(Ref ref) {
    return mapController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapController>(value),
    );
  }
}

String _$mapControllerHash() => r'01091ae14b2433a24e4f7bb7fa96482892ee07d1';

@ProviderFor(segmentHitLayer)
final segmentHitLayerProvider = SegmentHitLayerProvider._();

final class SegmentHitLayerProvider
    extends
        $FunctionalProvider<
          ValueNotifier<LayerHitResult<MapElement>?>,
          ValueNotifier<LayerHitResult<MapElement>?>,
          ValueNotifier<LayerHitResult<MapElement>?>
        >
    with $Provider<ValueNotifier<LayerHitResult<MapElement>?>> {
  SegmentHitLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'segmentHitLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$segmentHitLayerHash();

  @$internal
  @override
  $ProviderElement<ValueNotifier<LayerHitResult<MapElement>?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueNotifier<LayerHitResult<MapElement>?> create(Ref ref) {
    return segmentHitLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueNotifier<LayerHitResult<MapElement>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ValueNotifier<LayerHitResult<MapElement>?>>(value),
    );
  }
}

String _$segmentHitLayerHash() => r'f3393b6fc3c03ecef298578c5555912cfb178333';

@ProviderFor(sketchHitLayer)
final sketchHitLayerProvider = SketchHitLayerProvider._();

final class SketchHitLayerProvider
    extends
        $FunctionalProvider<
          ValueNotifier<LayerHitResult<MapElement>?>,
          ValueNotifier<LayerHitResult<MapElement>?>,
          ValueNotifier<LayerHitResult<MapElement>?>
        >
    with $Provider<ValueNotifier<LayerHitResult<MapElement>?>> {
  SketchHitLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sketchHitLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sketchHitLayerHash();

  @$internal
  @override
  $ProviderElement<ValueNotifier<LayerHitResult<MapElement>?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueNotifier<LayerHitResult<MapElement>?> create(Ref ref) {
    return sketchHitLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueNotifier<LayerHitResult<MapElement>?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ValueNotifier<LayerHitResult<MapElement>?>>(value),
    );
  }
}

String _$sketchHitLayerHash() => r'1de04bdaff4eacc335653d49467b50f7261b4762';

@ProviderFor(PanMapController)
final panMapControllerProvider = PanMapControllerProvider._();

final class PanMapControllerProvider
    extends $NotifierProvider<PanMapController, bool> {
  PanMapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panMapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panMapControllerHash();

  @$internal
  @override
  PanMapController create() => PanMapController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$panMapControllerHash() => r'0fb8165de125bcefd8376999411bb75487972a6c';

abstract class _$PanMapController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
