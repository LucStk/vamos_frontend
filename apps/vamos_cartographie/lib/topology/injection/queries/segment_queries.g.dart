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

String _$segmentNodeHash() => r'11f9dce651845e6e166e8f5618a4c25634a6b238';

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
    extends
        $FunctionalProvider<
          NodeState<SegmentFields>,
          NodeState<SegmentFields>,
          NodeState<SegmentFields>
        >
    with $Provider<NodeState<SegmentFields>> {
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
  $ProviderElement<NodeState<SegmentFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NodeState<SegmentFields> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segment(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeState<SegmentFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeState<SegmentFields>>(value),
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

String _$segmentHash() => r'64b84be2ffc5242e857de5e669ffbe1fae3a2955';

final class SegmentFamily extends $Family
    with
        $FunctionalFamilyOverride<
          NodeState<SegmentFields>,
          (TripId, SegmentId)
        > {
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
