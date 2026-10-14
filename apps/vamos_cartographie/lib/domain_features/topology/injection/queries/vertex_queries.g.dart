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
          GraphNode<VertexFields>,
          GraphNode<VertexFields>,
          GraphNode<VertexFields>
        >
    with $Provider<GraphNode<VertexFields>> {
  VertexNodeProvider._({
    required VertexNodeFamily super.from,
    required (TripId, VertexId) super.argument,
  }) : super(
         retry: null,
         name: r'vertexNodeProvider',
         isAutoDispose: false,
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
  $ProviderElement<GraphNode<VertexFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<VertexFields> create(Ref ref) {
    final argument = this.argument as (TripId, VertexId);
    return vertexNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<VertexFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<VertexFields>>(value),
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

String _$vertexNodeHash() => r'2ebf57e90caf5bf04659bd9f721773dc6ecc58a9';

final class VertexNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<GraphNode<VertexFields>, (TripId, VertexId)> {
  VertexNodeFamily._()
    : super(
        retry: null,
        name: r'vertexNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  VertexNodeProvider call(TripId tripId, VertexId id) =>
      VertexNodeProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'vertexNodeProvider';
}

@ProviderFor(vertex)
final vertexProvider = VertexFamily._();

final class VertexProvider
    extends $FunctionalProvider<VertexFields, VertexFields, VertexFields>
    with $Provider<VertexFields> {
  VertexProvider._({
    required VertexFamily super.from,
    required (TripId, VertexId) super.argument,
  }) : super(
         retry: null,
         name: r'vertexProvider',
         isAutoDispose: false,
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
  $ProviderElement<VertexFields> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexFields create(Ref ref) {
    final argument = this.argument as (TripId, VertexId);
    return vertex(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexFields value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexFields>(value),
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

String _$vertexHash() => r'528527454e76be02781a10596808b34f3eb6ec5c';

final class VertexFamily extends $Family
    with $FunctionalFamilyOverride<VertexFields, (TripId, VertexId)> {
  VertexFamily._()
    : super(
        retry: null,
        name: r'vertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  VertexProvider call(TripId tripId, VertexId id) =>
      VertexProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'vertexProvider';
}

@ProviderFor(allVertex)
final allVertexProvider = AllVertexFamily._();

final class AllVertexProvider
    extends
        $FunctionalProvider<
          List<VertexFields>,
          List<VertexFields>,
          List<VertexFields>
        >
    with $Provider<List<VertexFields>> {
  AllVertexProvider._({
    required AllVertexFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allVertexProvider',
         isAutoDispose: false,
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
  $ProviderElement<List<VertexFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<VertexFields> create(Ref ref) {
    final argument = this.argument as TripId;
    return allVertex(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VertexFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VertexFields>>(value),
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

String _$allVertexHash() => r'aa538c1a1ee69d61e7bb945c9984e63a11b2c77c';

final class AllVertexFamily extends $Family
    with $FunctionalFamilyOverride<List<VertexFields>, TripId> {
  AllVertexFamily._()
    : super(
        retry: null,
        name: r'allVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AllVertexProvider call(TripId tripId) =>
      AllVertexProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allVertexProvider';
}

@ProviderFor(allVertexIds)
final allVertexIdsProvider = AllVertexIdsFamily._();

final class AllVertexIdsProvider
    extends $FunctionalProvider<List<VertexId>, List<VertexId>, List<VertexId>>
    with $Provider<List<VertexId>> {
  AllVertexIdsProvider._({
    required AllVertexIdsFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allVertexIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allVertexIdsHash();

  @override
  String toString() {
    return r'allVertexIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<VertexId>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<VertexId> create(Ref ref) {
    final argument = this.argument as TripId;
    return allVertexIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VertexId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VertexId>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllVertexIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allVertexIdsHash() => r'561c8c128729684dd2e29c2a6300dca9487b695b';

final class AllVertexIdsFamily extends $Family
    with $FunctionalFamilyOverride<List<VertexId>, TripId> {
  AllVertexIdsFamily._()
    : super(
        retry: null,
        name: r'allVertexIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllVertexIdsProvider call(TripId tripId) =>
      AllVertexIdsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allVertexIdsProvider';
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
         isAutoDispose: false,
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
    r'a3d4d49cbc1cab629c894c1c190579c13438db39';

final class WaypointFromVertexFamily extends $Family
    with $FunctionalFamilyOverride<WaypointId?, (TripId, VertexId)> {
  WaypointFromVertexFamily._()
    : super(
        retry: null,
        name: r'waypointFromVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  WaypointFromVertexProvider call(TripId tripId, VertexId vertexId) =>
      WaypointFromVertexProvider._(argument: (tripId, vertexId), from: this);

  @override
  String toString() => r'waypointFromVertexProvider';
}
