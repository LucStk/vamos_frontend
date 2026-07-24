// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentNode)
final segmentNodeProvider = SegmentNodeFamily._();

final class SegmentNodeProvider
    extends
        $FunctionalProvider<
          GraphNode<SegmentFields>,
          GraphNode<SegmentFields>,
          GraphNode<SegmentFields>
        >
    with $Provider<GraphNode<SegmentFields>> {
  SegmentNodeProvider._({
    required SegmentNodeFamily super.from,
    required (TripId, SegmentId) super.argument,
  }) : super(
         retry: null,
         name: r'segmentNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentNodeHash();

  @override
  String toString() {
    return r'segmentNodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<SegmentFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<SegmentFields> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segmentNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<SegmentFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<SegmentFields>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentNodeHash() => r'a0eefb4e7f538f0a9b27db5315dfd3eeb4cb861d';

final class SegmentNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          GraphNode<SegmentFields>,
          (TripId, SegmentId)
        > {
  SegmentNodeFamily._()
    : super(
        retry: null,
        name: r'segmentNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentNodeProvider call(TripId tripId, SegmentId id) =>
      SegmentNodeProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'segmentNodeProvider';
}

@ProviderFor(segment)
final segmentProvider = SegmentFamily._();

final class SegmentProvider
    extends $FunctionalProvider<SegmentFields, SegmentFields, SegmentFields>
    with $Provider<SegmentFields> {
  SegmentProvider._({
    required SegmentFamily super.from,
    required (TripId, SegmentId) super.argument,
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
  $ProviderElement<SegmentFields> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentFields create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segment(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentFields value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentFields>(value),
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

String _$segmentHash() => r'89105d6a11cc5f022bc642085e572f2480ffa376';

final class SegmentFamily extends $Family
    with $FunctionalFamilyOverride<SegmentFields, (TripId, SegmentId)> {
  SegmentFamily._()
    : super(
        retry: null,
        name: r'segmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentProvider call(TripId tripId, SegmentId id) =>
      SegmentProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'segmentProvider';
}
