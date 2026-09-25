// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_hit_test_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapHitTest)
final mapHitTestProvider = MapHitTestFamily._();

final class MapHitTestProvider
    extends $FunctionalProvider<HitTest, HitTest, HitTest>
    with $Provider<HitTest> {
  MapHitTestProvider._({
    required MapHitTestFamily super.from,
    required ProviderListenable<MapScene> super.argument,
  }) : super(
         retry: null,
         name: r'mapHitTestProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = mapCameraHolderProvider;
  static final $allTransitiveDependencies1 =
      MapCameraHolderProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$mapHitTestHash();

  @override
  String toString() {
    return r'mapHitTestProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<HitTest> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HitTest create(Ref ref) {
    final argument = this.argument as ProviderListenable<MapScene>;
    return mapHitTest(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HitTest value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HitTest>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapHitTestProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapHitTestHash() => r'8624a1b329e635d865224e8adbd7a8a6fa1036da';

final class MapHitTestFamily extends $Family
    with $FunctionalFamilyOverride<HitTest, ProviderListenable<MapScene>> {
  MapHitTestFamily._()
    : super(
        retry: null,
        name: r'mapHitTestProvider',
        dependencies: <ProviderOrFamily>[mapCameraHolderProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          MapHitTestProvider.$allTransitiveDependencies0,
          MapHitTestProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  MapHitTestProvider call(ProviderListenable<MapScene> sceneProvider) =>
      MapHitTestProvider._(argument: sceneProvider, from: this);

  @override
  String toString() => r'mapHitTestProvider';
}
