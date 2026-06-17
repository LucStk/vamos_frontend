// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_interaction_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapInteraction)
final mapInteractionProvider = MapInteractionProvider._();

final class MapInteractionProvider
    extends $NotifierProvider<MapInteraction, LayerHitResult<Id<Segment>>?> {
  MapInteractionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapInteractionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapInteractionHash();

  @$internal
  @override
  MapInteraction create() => MapInteraction();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LayerHitResult<Id<Segment>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LayerHitResult<Id<Segment>>?>(value),
    );
  }
}

String _$mapInteractionHash() => r'b3090bbe49297e932d0c99161bc0e7f6df47ee7c';

abstract class _$MapInteraction
    extends $Notifier<LayerHitResult<Id<Segment>>?> {
  LayerHitResult<Id<Segment>>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<LayerHitResult<Id<Segment>>?, LayerHitResult<Id<Segment>>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                LayerHitResult<Id<Segment>>?,
                LayerHitResult<Id<Segment>>?
              >,
              LayerHitResult<Id<Segment>>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
