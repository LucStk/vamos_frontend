// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SegmentsNotifier)
final segmentsProvider = SegmentsNotifierFamily._();

final class SegmentsNotifierProvider
    extends $AsyncNotifierProvider<SegmentsNotifier, Map<int, Segment>> {
  SegmentsNotifierProvider._({
    required SegmentsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'segmentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentsNotifierHash();

  @override
  String toString() {
    return r'segmentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SegmentsNotifier create() => SegmentsNotifier();

  @override
  bool operator ==(Object other) {
    return other is SegmentsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentsNotifierHash() => r'345dae3b5a0007ce22320c821a6950d364c0d111';

final class SegmentsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SegmentsNotifier,
          AsyncValue<Map<int, Segment>>,
          Map<int, Segment>,
          FutureOr<Map<int, Segment>>,
          int
        > {
  SegmentsNotifierFamily._()
    : super(
        retry: null,
        name: r'segmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentsNotifierProvider call(int tripId) =>
      SegmentsNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentsProvider';
}

abstract class _$SegmentsNotifier extends $AsyncNotifier<Map<int, Segment>> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  FutureOr<Map<int, Segment>> build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Map<int, Segment>>, Map<int, Segment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Map<int, Segment>>, Map<int, Segment>>,
              AsyncValue<Map<int, Segment>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(segmentIds)
final segmentIdsProvider = SegmentIdsFamily._();

final class SegmentIdsProvider
    extends $FunctionalProvider<List<int>, List<int>, List<int>>
    with $Provider<List<int>> {
  SegmentIdsProvider._({
    required SegmentIdsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'segmentIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentIdsHash();

  @override
  String toString() {
    return r'segmentIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<int> create(Ref ref) {
    final argument = this.argument as int;
    return segmentIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentIdsHash() => r'f603e38ae657271f00d6e929f239af867f0908b0';

final class SegmentIdsFamily extends $Family
    with $FunctionalFamilyOverride<List<int>, int> {
  SegmentIdsFamily._()
    : super(
        retry: null,
        name: r'segmentIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentIdsProvider call(int tripId) =>
      SegmentIdsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentIdsProvider';
}

@ProviderFor(segment)
final segmentProvider = SegmentFamily._();

final class SegmentProvider
    extends $FunctionalProvider<Segment?, Segment?, Segment?>
    with $Provider<Segment?> {
  SegmentProvider._({
    required SegmentFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentHash();

  @override
  String toString() {
    return r'segmentProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Segment?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Segment? create(Ref ref) {
    final argument = this.argument as (int, int);
    return segment(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Segment? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Segment?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentHash() => r'7d8826fab9f0b2909a77aed4e99bfcea402807de';

final class SegmentFamily extends $Family
    with $FunctionalFamilyOverride<Segment?, (int, int)> {
  SegmentFamily._()
    : super(
        retry: null,
        name: r'segmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentProvider call(int tripId, int segmentId) =>
      SegmentProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentProvider';
}

@ProviderFor(segmentPoints)
final segmentPointsProvider = SegmentPointsFamily._();

final class SegmentPointsProvider
    extends $FunctionalProvider<List<LatLng>?, List<LatLng>?, List<LatLng>?>
    with $Provider<List<LatLng>?> {
  SegmentPointsProvider._({
    required SegmentPointsFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentPointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentPointsHash();

  @override
  String toString() {
    return r'segmentPointsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<LatLng>?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LatLng>? create(Ref ref) {
    final argument = this.argument as (int, int);
    return segmentPoints(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LatLng>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LatLng>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentPointsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentPointsHash() => r'079efbf0cd4f8a134884a58c58d47ac9eabf164e';

final class SegmentPointsFamily extends $Family
    with $FunctionalFamilyOverride<List<LatLng>?, (int, int)> {
  SegmentPointsFamily._()
    : super(
        retry: null,
        name: r'segmentPointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentPointsProvider call(int tripId, int segmentId) =>
      SegmentPointsProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentPointsProvider';
}
