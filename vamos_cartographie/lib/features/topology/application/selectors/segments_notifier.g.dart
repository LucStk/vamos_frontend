// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$segmentIdsHash() => r'fd5c189132dbaf072c51460e234b11a5c0831cff';

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

@ProviderFor(segmentById)
final segmentByIdProvider = SegmentByIdFamily._();

final class SegmentByIdProvider
    extends $FunctionalProvider<Segment?, Segment?, Segment?>
    with $Provider<Segment?> {
  SegmentByIdProvider._({
    required SegmentByIdFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'segmentByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentByIdHash();

  @override
  String toString() {
    return r'segmentByIdProvider'
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
    return segmentById(ref, argument.$1, argument.$2);
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
    return other is SegmentByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentByIdHash() => r'96def0d5501ec98d40387e4df4ab468c2f21d0e1';

final class SegmentByIdFamily extends $Family
    with $FunctionalFamilyOverride<Segment?, (int, int)> {
  SegmentByIdFamily._()
    : super(
        retry: null,
        name: r'segmentByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentByIdProvider call(int tripId, int segmentId) =>
      SegmentByIdProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentByIdProvider';
}
