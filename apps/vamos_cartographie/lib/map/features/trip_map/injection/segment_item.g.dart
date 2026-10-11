// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentItem)
final segmentItemProvider = SegmentItemFamily._();

final class SegmentItemProvider
    extends $FunctionalProvider<SegmentItem, SegmentItem, SegmentItem>
    with $Provider<SegmentItem> {
  SegmentItemProvider._({
    required SegmentItemFamily super.from,
    required (TripId, SegmentId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'segmentItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentItemHash();

  @override
  String toString() {
    return r'segmentItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<SegmentItem> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentItem create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId, MapCameraReader);
    return segmentItem(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentItem value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentItem>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentItemHash() => r'225561c878a42789e1992dfb236c1fb068a2e6ee';

final class SegmentItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          SegmentItem,
          (TripId, SegmentId, MapCameraReader)
        > {
  SegmentItemFamily._()
    : super(
        retry: null,
        name: r'segmentItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: true,
      );

  SegmentItemProvider call(
    TripId tripId,
    SegmentId id,
    MapCameraReader cameraReader,
  ) => SegmentItemProvider._(argument: (tripId, id, cameraReader), from: this);

  @override
  String toString() => r'segmentItemProvider';
}
