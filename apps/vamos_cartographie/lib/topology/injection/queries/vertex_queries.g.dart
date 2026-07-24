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

String _$vertexNodeHash() => r'8eaed2c3ffeccf8d5d8edf702da8e5000d572e35';

final class VertexNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<GraphNode<VertexFields>, (TripId, VertexId)> {
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
    extends $FunctionalProvider<VertexFields, VertexFields, VertexFields>
    with $Provider<VertexFields> {
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

String _$vertexHash() => r'4fc6b6b24760611f169e0b79f9d415285c9ce2e9';

final class VertexFamily extends $Family
    with $FunctionalFamilyOverride<VertexFields, (TripId, VertexId)> {
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

String _$allVertexHash() => r'8d0556f7b2bdd934fc917454f9b3bcaa89eea1aa';

final class AllVertexFamily extends $Family
    with $FunctionalFamilyOverride<List<VertexFields>, TripId> {
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
    r'b9b629e8c55376b6f1659906c86b91cb9c6f7a00';

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

String _$isVertexSelectedHash() => r'513644236cfce29b6f0492fc07a7594b8343728e';

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
