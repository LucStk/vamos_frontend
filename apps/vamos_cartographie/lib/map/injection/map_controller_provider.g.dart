// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller_provider.dart';

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

@ProviderFor(animatedMapController)
final animatedMapControllerProvider = AnimatedMapControllerProvider._();

final class AnimatedMapControllerProvider
    extends
        $FunctionalProvider<
          AnimatedMapController,
          AnimatedMapController,
          AnimatedMapController
        >
    with $Provider<AnimatedMapController> {
  AnimatedMapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'animatedMapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$animatedMapControllerHash();

  @$internal
  @override
  $ProviderElement<AnimatedMapController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AnimatedMapController create(Ref ref) {
    return animatedMapController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnimatedMapController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnimatedMapController>(value),
    );
  }
}

String _$animatedMapControllerHash() =>
    r'84bcad3bf1cd599ae4e9356b1a841d00c9c08eba';

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

String _$panMapControllerHash() => r'bedcfb670690b29ce942fefad7c3db849ffec4dc';

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
