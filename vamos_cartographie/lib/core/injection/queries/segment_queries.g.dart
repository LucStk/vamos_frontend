// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segments)
final segmentsProvider = SegmentsFamily._();

final class SegmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SegmentUiModel>>,
          List<SegmentUiModel>,
          FutureOr<List<SegmentUiModel>>
        >
    with
        $FutureModifier<List<SegmentUiModel>>,
        $FutureProvider<List<SegmentUiModel>> {
  SegmentsProvider._({
    required SegmentsFamily super.from,
    required (TripId, SegmentId) super.argument,
  }) : super(
         retry: null,
         name: r'segmentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentsHash();

  @override
  String toString() {
    return r'segmentsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<SegmentUiModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SegmentUiModel>> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segments(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentsHash() => r'0c89868c017bb2b3e554911912012e0e3f7c1d46';

final class SegmentsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<SegmentUiModel>>,
          (TripId, SegmentId)
        > {
  SegmentsFamily._()
    : super(
        retry: null,
        name: r'segmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentsProvider call(TripId tripId, SegmentId segId) =>
      SegmentsProvider._(argument: (tripId, segId), from: this);

  @override
  String toString() => r'segmentsProvider';
}
