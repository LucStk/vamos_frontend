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
          GraphNode<Segment>,
          GraphNode<Segment>,
          GraphNode<Segment>
        >
    with $Provider<GraphNode<Segment>> {
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
  $ProviderElement<GraphNode<Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<Segment> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segmentNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<Segment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<Segment>>(value),
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

String _$segmentNodeHash() => r'1b40fb9752f7e8f7d37116951ed21df1a1a5335d';

final class SegmentNodeFamily extends $Family
    with $FunctionalFamilyOverride<GraphNode<Segment>, (TripId, SegmentId)> {
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
          NodeState<Segment>,
          NodeState<Segment>,
          NodeState<Segment>
        >
    with $Provider<NodeState<Segment>> {
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
  $ProviderElement<NodeState<Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NodeState<Segment> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return segment(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeState<Segment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeState<Segment>>(value),
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

String _$segmentHash() => r'77d7a14d67a6ea884d63ec923e64967ae86bac7a';

final class SegmentFamily extends $Family
    with $FunctionalFamilyOverride<NodeState<Segment>, (TripId, SegmentId)> {
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
