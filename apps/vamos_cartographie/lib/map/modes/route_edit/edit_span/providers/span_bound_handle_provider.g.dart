// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'span_bound_handle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(spanBoundHandleItems)
final spanBoundHandleItemsProvider = SpanBoundHandleItemsFamily._();

final class SpanBoundHandleItemsProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  SpanBoundHandleItemsProvider._({
    required SpanBoundHandleItemsFamily super.from,
    required (TripId, MobilitySpanId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'spanBoundHandleItemsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = modeSlotProvider;
  static final $allTransitiveDependencies1 =
      ModeSlotProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$spanBoundHandleItemsHash();

  @override
  String toString() {
    return r'spanBoundHandleItemsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as (TripId, MobilitySpanId, MapCameraReader);
    return spanBoundHandleItems(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SceneItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SceneItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SpanBoundHandleItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$spanBoundHandleItemsHash() =>
    r'0ac9ad035144916edc293a34e5a594ff177cbe11';

final class SpanBoundHandleItemsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          List<SceneItem>,
          (TripId, MobilitySpanId, MapCameraReader)
        > {
  SpanBoundHandleItemsFamily._()
    : super(
        retry: null,
        name: r'spanBoundHandleItemsProvider',
        dependencies: <ProviderOrFamily>[modeSlotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          SpanBoundHandleItemsProvider.$allTransitiveDependencies0,
          SpanBoundHandleItemsProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  SpanBoundHandleItemsProvider call(
    TripId tripId,
    MobilitySpanId spanId,
    MapCameraReader camera,
  ) => SpanBoundHandleItemsProvider._(
    argument: (tripId, spanId, camera),
    from: this,
  );

  @override
  String toString() => r'spanBoundHandleItemsProvider';
}
