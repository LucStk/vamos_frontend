// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertexNode)
final vertexNodeProvider = VertexNodeFamily._();

final class VertexNodeProvider
    extends
        $FunctionalProvider<
          GraphNode<Vertex>,
          GraphNode<Vertex>,
          GraphNode<Vertex>
        >
    with $Provider<GraphNode<Vertex>> {
  VertexNodeProvider._({
    required VertexNodeFamily super.from,
    required (TripId, VertexId) super.argument,
  }) : super(
         retry: null,
         name: r'vertexNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexNodeHash();

  @override
  String toString() {
    return r'vertexNodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<Vertex>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<Vertex> create(Ref ref) {
    final argument = this.argument as (TripId, VertexId);
    return vertexNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<Vertex> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<Vertex>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexNodeHash() => r'c4005474d5b24693e875d243063dc4d2d101782f';

final class VertexNodeFamily extends $Family
    with $FunctionalFamilyOverride<GraphNode<Vertex>, (TripId, VertexId)> {
  VertexNodeFamily._()
    : super(
        retry: null,
        name: r'vertexNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexNodeProvider call(TripId tripId, VertexId id) =>
      VertexNodeProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'vertexNodeProvider';
}

@ProviderFor(vertex)
final vertexProvider = VertexFamily._();

final class VertexProvider
    extends
        $FunctionalProvider<
          NodeState<Vertex>,
          NodeState<Vertex>,
          NodeState<Vertex>
        >
    with $Provider<NodeState<Vertex>> {
  VertexProvider._({
    required VertexFamily super.from,
    required (TripId, VertexId) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<NodeState<Vertex>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NodeState<Vertex> create(Ref ref) {
    final argument = this.argument as (TripId, VertexId);
    return vertex(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeState<Vertex> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeState<Vertex>>(value),
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

String _$vertexHash() => r'2623824c0d3305876c739134d7512d2529628116';

final class VertexFamily extends $Family
    with $FunctionalFamilyOverride<NodeState<Vertex>, (TripId, VertexId)> {
  VertexFamily._()
    : super(
        retry: null,
        name: r'vertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexProvider call(TripId tripId, VertexId id) =>
      VertexProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'vertexProvider';
}

@ProviderFor(allVertex)
final allVertexProvider = AllVertexFamily._();

final class AllVertexProvider
    extends $FunctionalProvider<List<Vertex>, List<Vertex>, List<Vertex>>
    with $Provider<List<Vertex>> {
  AllVertexProvider._({
    required AllVertexFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allVertexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allVertexHash();

  @override
  String toString() {
    return r'allVertexProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Vertex>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Vertex> create(Ref ref) {
    final argument = this.argument as TripId;
    return allVertex(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Vertex> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Vertex>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllVertexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allVertexHash() => r'9019137a815d2c70f4a8090bdee22c715af8628a';

final class AllVertexFamily extends $Family
    with $FunctionalFamilyOverride<List<Vertex>, TripId> {
  AllVertexFamily._()
    : super(
        retry: null,
        name: r'allVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllVertexProvider call(TripId tripId) =>
      AllVertexProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allVertexProvider';
}

@ProviderFor(waypointFromVertex)
final waypointFromVertexProvider = WaypointFromVertexFamily._();

final class WaypointFromVertexProvider
    extends $FunctionalProvider<WaypointId?, WaypointId?, WaypointId?>
    with $Provider<WaypointId?> {
  WaypointFromVertexProvider._({
    required WaypointFromVertexFamily super.from,
    required (TripId, VertexId) super.argument,
  }) : super(
         retry: null,
         name: r'waypointFromVertexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointFromVertexHash();

  @override
  String toString() {
    return r'waypointFromVertexProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<WaypointId?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointId? create(Ref ref) {
    final argument = this.argument as (TripId, VertexId);
    return waypointFromVertex(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointId? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointId?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointFromVertexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointFromVertexHash() =>
    r'aa1db9e4cf4eedda9f9cf81ac26d6cb547b21767';

final class WaypointFromVertexFamily extends $Family
    with $FunctionalFamilyOverride<WaypointId?, (TripId, VertexId)> {
  WaypointFromVertexFamily._()
    : super(
        retry: null,
        name: r'waypointFromVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointFromVertexProvider call(TripId tripId, VertexId vertexId) =>
      WaypointFromVertexProvider._(argument: (tripId, vertexId), from: this);

  @override
  String toString() => r'waypointFromVertexProvider';
}

@ProviderFor(isVertexSelected)
final isVertexSelectedProvider = IsVertexSelectedFamily._();

final class IsVertexSelectedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsVertexSelectedProvider._({
    required IsVertexSelectedFamily super.from,
    required (TripId, VertexId) super.argument,
  }) : super(
         retry: null,
         name: r'isVertexSelectedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isVertexSelectedHash();

  @override
  String toString() {
    return r'isVertexSelectedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as (TripId, VertexId);
    return isVertexSelected(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsVertexSelectedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isVertexSelectedHash() => r'989c434f4a61f2bf9ad920f6c3ba440e695c4698';

final class IsVertexSelectedFamily extends $Family
    with $FunctionalFamilyOverride<bool, (TripId, VertexId)> {
  IsVertexSelectedFamily._()
    : super(
        retry: null,
        name: r'isVertexSelectedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsVertexSelectedProvider call(TripId tripId, VertexId vertexId) =>
      IsVertexSelectedProvider._(argument: (tripId, vertexId), from: this);

  @override
  String toString() => r'isVertexSelectedProvider';
}
