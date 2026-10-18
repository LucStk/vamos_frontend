// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_item_provider.dart';

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
  $ProviderElement<SegmentItem> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentItem create(Ref ref) {
    final argument = this.argument as (TripId, SectionId, MapCameraReader);
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

String _$segmentItemHash() => r'bf140ccec1520f1b7c4754a492647b49a7fc5248';

final class SegmentItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          SegmentItem,
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

  SegmentItemProvider call(
    TripId tripId,
    SectionId id,
    MapCameraReader cameraReader,
  ) => SegmentItemProvider._(argument: (tripId, id, cameraReader), from: this);

  @override
  String toString() => r'segmentItemProvider';
}

@ProviderFor(allSegmentItem)
final allSegmentItemProvider = AllSegmentItemFamily._();

final class AllSegmentItemProvider
    extends $FunctionalProvider<List<LineItem>, List<LineItem>, List<LineItem>>
    with $Provider<List<LineItem>> {
  AllSegmentItemProvider._({
    required AllSegmentItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'allSegmentItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = segmentItemProvider;

  @override
  String debugGetCreateSourceHash() => _$allSegmentItemHash();

  @override
  String toString() {
    return r'allSegmentItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<LineItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LineItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return allSegmentItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LineItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LineItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllSegmentItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allSegmentItemHash() => r'ef89d379fc4c76d81483f27aff43dd134738cfe8';

final class AllSegmentItemFamily extends $Family
    with $FunctionalFamilyOverride<List<LineItem>, (TripId, MapCameraReader)> {
  AllSegmentItemFamily._()
    : super(
        retry: null,
        name: r'allSegmentItemProvider',
        dependencies: <ProviderOrFamily>[segmentItemProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          AllSegmentItemProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: false,
      );

  AllSegmentItemProvider call(TripId tripId, MapCameraReader camera) =>
      AllSegmentItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'allSegmentItemProvider';
}
