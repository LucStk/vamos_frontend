// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmp_origin_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tmpOriginItem)
final tmpOriginItemProvider = TmpOriginItemFamily._();

final class TmpOriginItemProvider
    extends
        $FunctionalProvider<
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?,
          TripOriginItem<MapRouteOrigin>?
        >
    with $Provider<TripOriginItem<MapRouteOrigin>?> {
  TmpOriginItemProvider._({
    required TmpOriginItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'tmpOriginItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = modeSlotProvider;
  static final $allTransitiveDependencies1 =
      ModeSlotProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$tmpOriginItemHash();

  @override
  String toString() {
    return r'tmpOriginItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TripOriginItem<MapRouteOrigin>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripOriginItem<MapRouteOrigin>? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return tmpOriginItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripOriginItem<MapRouteOrigin>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripOriginItem<MapRouteOrigin>?>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TmpOriginItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tmpOriginItemHash() => r'ce80d8ebe1d41da6308d317ff80e3eae0c952586';

final class TmpOriginItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          TripOriginItem<MapRouteOrigin>?,
          MapCameraReader
        > {
  TmpOriginItemFamily._()
    : super(
        retry: null,
        name: r'tmpOriginItemProvider',
        dependencies: <ProviderOrFamily>[modeSlotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          TmpOriginItemProvider.$allTransitiveDependencies0,
          TmpOriginItemProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  TmpOriginItemProvider call(MapCameraReader camera) =>
      TmpOriginItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'tmpOriginItemProvider';
}
