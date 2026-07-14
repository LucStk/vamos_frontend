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
    required SegmentId super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<Segment> create(Ref ref) {
    final argument = this.argument as SegmentId;
    return segmentNode(ref, argument);
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

String _$segmentNodeHash() => r'68d647ec5fe1aff7118a311ac0302f01ac4b5c12';

final class SegmentNodeFamily extends $Family
    with $FunctionalFamilyOverride<GraphNode<Segment>, SegmentId> {
  SegmentNodeFamily._()
    : super(
        retry: null,
        name: r'segmentNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentNodeProvider call(SegmentId id) =>
      SegmentNodeProvider._(argument: id, from: this);

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
    required SegmentId super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<NodeState<Segment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NodeState<Segment> create(Ref ref) {
    final argument = this.argument as SegmentId;
    return segment(ref, argument);
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

String _$segmentHash() => r'3689961adb83cda9e6c75dff768de3ad4aaa1d3f';

final class SegmentFamily extends $Family
    with $FunctionalFamilyOverride<NodeState<Segment>, SegmentId> {
  SegmentFamily._()
    : super(
        retry: null,
        name: r'segmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentProvider call(SegmentId id) =>
      SegmentProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentProvider';
}
