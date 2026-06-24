// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentsUi)
final segmentsUiProvider = SegmentsUiFamily._();

final class SegmentsUiProvider
    extends
        $FunctionalProvider<
          List<SegmentUiModel>,
          List<SegmentUiModel>,
          List<SegmentUiModel>
        >
    with $Provider<List<SegmentUiModel>> {
  SegmentsUiProvider._({
    required SegmentsUiFamily super.from,
    required (TripId, SegmentId) super.argument,
  }) : super(
         retry: null,
         name: r'segmentsUiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentsUiHash();

  @override
  String toString() {
    return r'segmentsUiProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SegmentUiModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<SegmentUiModel> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segmentsUi(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SegmentUiModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SegmentUiModel>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentsUiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentsUiHash() => r'297b61c881cf22752a4eaf70ea70011d77ce30e5';

final class SegmentsUiFamily extends $Family
    with $FunctionalFamilyOverride<List<SegmentUiModel>, (TripId, SegmentId)> {
  SegmentsUiFamily._()
    : super(
        retry: null,
        name: r'segmentsUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentsUiProvider call(TripId tripId, SegmentId segId) =>
      SegmentsUiProvider._(argument: (tripId, segId), from: this);

  @override
  String toString() => r'segmentsUiProvider';
}
