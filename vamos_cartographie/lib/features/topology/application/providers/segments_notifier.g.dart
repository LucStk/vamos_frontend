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

String _$segmentsNotifierHash() => r'2989407673e1dd045202f9e436432420fba39cce';

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

@ProviderFor(segmentMap)
final segmentMapProvider = SegmentMapFamily._();

final class SegmentMapProvider
    extends
        $FunctionalProvider<
          Map<int, Segment>,
          Map<int, Segment>,
          Map<int, Segment>
        >
    with $Provider<Map<int, Segment>> {
  SegmentMapProvider._({
    required SegmentMapFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'segmentMapProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentMapHash();

  @override
  String toString() {
    return r'segmentMapProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<int, Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<int, Segment> create(Ref ref) {
    final argument = this.argument as int;
    return segmentMap(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, Segment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, Segment>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentMapProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentMapHash() => r'4e7cb78a94ee9dd8624af5fd3a3def34765d24ab';

final class SegmentMapFamily extends $Family
    with $FunctionalFamilyOverride<Map<int, Segment>, int> {
  SegmentMapFamily._()
    : super(
        retry: null,
        name: r'segmentMapProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentMapProvider call(int tripId) =>
      SegmentMapProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentMapProvider';
}

@ProviderFor(segmentsIds)
final segmentsIdsProvider = SegmentsIdsFamily._();

final class SegmentsIdsProvider
    extends $FunctionalProvider<Iterable<int>, Iterable<int>, Iterable<int>>
    with $Provider<Iterable<int>> {
  SegmentsIdsProvider._({
    required SegmentsIdsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'segmentsIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentsIdsHash();

  @override
  String toString() {
    return r'segmentsIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Iterable<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Iterable<int> create(Ref ref) {
    final argument = this.argument as int;
    return segmentsIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentsIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentsIdsHash() => r'32d57de1b5512c9a1c8e9b45a2dbe206ba383605';

final class SegmentsIdsFamily extends $Family
    with $FunctionalFamilyOverride<Iterable<int>, int> {
  SegmentsIdsFamily._()
    : super(
        retry: null,
        name: r'segmentsIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentsIdsProvider call(int tripId) =>
      SegmentsIdsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'segmentsIdsProvider';
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

String _$segmentHash() => r'4242fb9374e9dfaa4a324e2e8b976c6aa0c1c595';

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
