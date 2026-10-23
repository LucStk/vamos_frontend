// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

@ProviderFor(segmentItem)
final segmentItemProvider = SegmentItemFamily._();

/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

final class SegmentItemProvider
    extends $FunctionalProvider<SegmentItem?, SegmentItem?, SegmentItem?>
    with $Provider<SegmentItem?> {
  /// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.
  SegmentItemProvider._({
    required SegmentItemFamily super.from,
    required (TripId, SectionId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'segmentItemProvider',
         isAutoDispose: false,
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
  $ProviderElement<SegmentItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentItem? create(Ref ref) {
    final argument = this.argument as (TripId, SectionId, MapCameraReader);
    return segmentItem(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentItem?>(value),
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

String _$segmentItemHash() => r'511a5d00e3c01ac08181a9675f21741d7047fea2';

/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

final class SegmentItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          SegmentItem?,
          (TripId, SectionId, MapCameraReader)
        > {
  SegmentItemFamily._()
    : super(
        retry: null,
        name: r'segmentItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  /// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

  SegmentItemProvider call(
    TripId tripId,
    SectionId id,
    MapCameraReader cameraReader,
  ) => SegmentItemProvider._(argument: (tripId, id, cameraReader), from: this);

  @override
  String toString() => r'segmentItemProvider';
}
