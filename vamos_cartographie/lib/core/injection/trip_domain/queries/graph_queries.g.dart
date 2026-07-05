// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertex)
final vertexProvider = VertexFamily._();

final class VertexProvider
    extends $FunctionalProvider<Vertex?, Vertex?, Vertex?>
    with $Provider<Vertex?> {
  VertexProvider._({
    required VertexFamily super.from,
    required VertexId super.argument,
  }) : super(
         retry: null,
         name: r'vertexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexHash();

  @override
  String toString() {
    return r'vertexProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Vertex?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Vertex? create(Ref ref) {
    final argument = this.argument as VertexId;
    return vertex(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Vertex? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Vertex?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexHash() => r'107254f3b7909f98f6bbe1e74737472476d05b93';

final class VertexFamily extends $Family
    with $FunctionalFamilyOverride<Vertex?, VertexId> {
  VertexFamily._()
    : super(
        retry: null,
        name: r'vertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexProvider call(VertexId id) =>
      VertexProvider._(argument: id, from: this);

  @override
  String toString() => r'vertexProvider';
}

@ProviderFor(vertexPatch)
final vertexPatchProvider = VertexPatchFamily._();

final class VertexPatchProvider
    extends $FunctionalProvider<VertexPatch?, VertexPatch?, VertexPatch?>
    with $Provider<VertexPatch?> {
  VertexPatchProvider._({
    required VertexPatchFamily super.from,
    required Id<VertexPatch> super.argument,
  }) : super(
         retry: null,
         name: r'vertexPatchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexPatchHash();

  @override
  String toString() {
    return r'vertexPatchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<VertexPatch?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexPatch? create(Ref ref) {
    final argument = this.argument as Id<VertexPatch>;
    return vertexPatch(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexPatch? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexPatch?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexPatchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexPatchHash() => r'8e32a0124e93d292513c363e29ae4b022bdb37e3';

final class VertexPatchFamily extends $Family
    with $FunctionalFamilyOverride<VertexPatch?, Id<VertexPatch>> {
  VertexPatchFamily._()
    : super(
        retry: null,
        name: r'vertexPatchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexPatchProvider call(Id<VertexPatch> id) =>
      VertexPatchProvider._(argument: id, from: this);

  @override
  String toString() => r'vertexPatchProvider';
}

@ProviderFor(segment)
final segmentProvider = SegmentFamily._();

final class SegmentProvider
    extends $FunctionalProvider<Segment?, Segment?, Segment?>
    with $Provider<Segment?> {
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
  $ProviderElement<Segment?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Segment? create(Ref ref) {
    final argument = this.argument as SegmentId;
    return segment(ref, argument);
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

String _$segmentHash() => r'5bbd7c73b21d1be753dbf237e8124f10347a295f';

final class SegmentFamily extends $Family
    with $FunctionalFamilyOverride<Segment?, SegmentId> {
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

@ProviderFor(segmentPatch)
final segmentPatchProvider = SegmentPatchFamily._();

final class SegmentPatchProvider
    extends $FunctionalProvider<SegmentPatch?, SegmentPatch?, SegmentPatch?>
    with $Provider<SegmentPatch?> {
  SegmentPatchProvider._({
    required SegmentPatchFamily super.from,
    required Id<SegmentPatch> super.argument,
  }) : super(
         retry: null,
         name: r'segmentPatchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentPatchHash();

  @override
  String toString() {
    return r'segmentPatchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SegmentPatch?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SegmentPatch? create(Ref ref) {
    final argument = this.argument as Id<SegmentPatch>;
    return segmentPatch(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentPatch? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentPatch?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentPatchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentPatchHash() => r'd2b64d2f1b14236d9bc1967ef8cc2bec239bc203';

final class SegmentPatchFamily extends $Family
    with $FunctionalFamilyOverride<SegmentPatch?, Id<SegmentPatch>> {
  SegmentPatchFamily._()
    : super(
        retry: null,
        name: r'segmentPatchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentPatchProvider call(Id<SegmentPatch> id) =>
      SegmentPatchProvider._(argument: id, from: this);

  @override
  String toString() => r'segmentPatchProvider';
}

@ProviderFor(topologyQueryHandler)
final topologyQueryHandlerProvider = TopologyQueryHandlerProvider._();

final class TopologyQueryHandlerProvider
    extends
        $FunctionalProvider<
          TopologyQueryHandler,
          TopologyQueryHandler,
          TopologyQueryHandler
        >
    with $Provider<TopologyQueryHandler> {
  TopologyQueryHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topologyQueryHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topologyQueryHandlerHash();

  @$internal
  @override
  $ProviderElement<TopologyQueryHandler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TopologyQueryHandler create(Ref ref) {
    return topologyQueryHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TopologyQueryHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TopologyQueryHandler>(value),
    );
  }
}

String _$topologyQueryHandlerHash() =>
    r'9613306bc470a959bf2793271262308dc0b535ce';

@ProviderFor(loadTopology)
final loadTopologyProvider = LoadTopologyFamily._();

final class LoadTopologyProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  LoadTopologyProvider._({
    required LoadTopologyFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'loadTopologyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadTopologyHash();

  @override
  String toString() {
    return r'loadTopologyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as TripId;
    return loadTopology(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadTopologyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadTopologyHash() => r'5bdd1b5654a674475f3c797810a8a2a92dd67642';

final class LoadTopologyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, TripId> {
  LoadTopologyFamily._()
    : super(
        retry: null,
        name: r'loadTopologyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadTopologyProvider call(TripId tripId) =>
      LoadTopologyProvider._(argument: tripId, from: this);

  @override
  String toString() => r'loadTopologyProvider';
}
