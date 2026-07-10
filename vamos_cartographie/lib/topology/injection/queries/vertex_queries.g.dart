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
          ObservableGraphNode<Vertex>,
          ObservableGraphNode<Vertex>,
          ObservableGraphNode<Vertex>
        >
    with $Provider<ObservableGraphNode<Vertex>> {
  VertexNodeProvider._({
    required VertexNodeFamily super.from,
    required VertexId super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ObservableGraphNode<Vertex>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableGraphNode<Vertex> create(Ref ref) {
    final argument = this.argument as VertexId;
    return vertexNode(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableGraphNode<Vertex> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableGraphNode<Vertex>>(value),
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

String _$vertexNodeHash() => r'dcc9d8c6bbc8ffad1df32511c5f97090f697d4bb';

final class VertexNodeFamily extends $Family
    with $FunctionalFamilyOverride<ObservableGraphNode<Vertex>, VertexId> {
  VertexNodeFamily._()
    : super(
        retry: null,
        name: r'vertexNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexNodeProvider call(VertexId id) =>
      VertexNodeProvider._(argument: id, from: this);

  @override
  String toString() => r'vertexNodeProvider';
}

@ProviderFor(vertexPatchNode)
final vertexPatchNodeProvider = VertexPatchNodeFamily._();

final class VertexPatchNodeProvider
    extends
        $FunctionalProvider<
          ObservableGraphNode<VertexPatch>,
          ObservableGraphNode<VertexPatch>,
          ObservableGraphNode<VertexPatch>
        >
    with $Provider<ObservableGraphNode<VertexPatch>> {
  VertexPatchNodeProvider._({
    required VertexPatchNodeFamily super.from,
    required Id<VertexPatch> super.argument,
  }) : super(
         retry: null,
         name: r'vertexPatchNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexPatchNodeHash();

  @override
  String toString() {
    return r'vertexPatchNodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ObservableGraphNode<VertexPatch>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableGraphNode<VertexPatch> create(Ref ref) {
    final argument = this.argument as Id<VertexPatch>;
    return vertexPatchNode(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableGraphNode<VertexPatch> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableGraphNode<VertexPatch>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexPatchNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexPatchNodeHash() => r'35b0fe46ff07c279b8c496f2e1c6caf7bd231623';

final class VertexPatchNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ObservableGraphNode<VertexPatch>,
          Id<VertexPatch>
        > {
  VertexPatchNodeFamily._()
    : super(
        retry: null,
        name: r'vertexPatchNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexPatchNodeProvider call(Id<VertexPatch> id) =>
      VertexPatchNodeProvider._(argument: id, from: this);

  @override
  String toString() => r'vertexPatchNodeProvider';
}

@ProviderFor(vertex)
final vertexProvider = VertexFamily._();

final class VertexProvider extends $FunctionalProvider<Vertex, Vertex, Vertex>
    with $Provider<Vertex> {
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
  $ProviderElement<Vertex> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Vertex create(Ref ref) {
    final argument = this.argument as VertexId;
    return vertex(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Vertex value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Vertex>(value),
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

String _$vertexHash() => r'3faf82875087e213d0b0d175f72541e516fd963a';

final class VertexFamily extends $Family
    with $FunctionalFamilyOverride<Vertex, VertexId> {
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
    extends $FunctionalProvider<VertexPatch, VertexPatch, VertexPatch>
    with $Provider<VertexPatch> {
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
  $ProviderElement<VertexPatch> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexPatch create(Ref ref) {
    final argument = this.argument as Id<VertexPatch>;
    return vertexPatch(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexPatch value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexPatch>(value),
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

String _$vertexPatchHash() => r'8fe96e2935842e09383b0e66eb1a51a79d70dcaf';

final class VertexPatchFamily extends $Family
    with $FunctionalFamilyOverride<VertexPatch, Id<VertexPatch>> {
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

@ProviderFor(vertexRefs)
final vertexRefsProvider = VertexRefsProvider._();

final class VertexRefsProvider
    extends
        $FunctionalProvider<List<VertexRef>, List<VertexRef>, List<VertexRef>>
    with $Provider<List<VertexRef>> {
  VertexRefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexRefsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexRefsHash();

  @$internal
  @override
  $ProviderElement<List<VertexRef>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<VertexRef> create(Ref ref) {
    return vertexRefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VertexRef> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VertexRef>>(value),
    );
  }
}

String _$vertexRefsHash() => r'fa3d295c0747af9cd14dd37bd742b9c17de1cd1d';

@ProviderFor(vertexUiElement)
final vertexUiElementProvider = VertexUiElementFamily._();

final class VertexUiElementProvider
    extends $FunctionalProvider<VertexElement, VertexElement, VertexElement>
    with $Provider<VertexElement> {
  VertexUiElementProvider._({
    required VertexUiElementFamily super.from,
    required (TripId, VertexRef) super.argument,
  }) : super(
         retry: null,
         name: r'vertexUiElementProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexUiElementHash();

  @override
  String toString() {
    return r'vertexUiElementProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<VertexElement> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexElement create(Ref ref) {
    final argument = this.argument as (TripId, VertexRef);
    return vertexUiElement(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexElement value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexElement>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexUiElementProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexUiElementHash() => r'd611ff82402f8a79770d5c6436a2c8995578237f';

final class VertexUiElementFamily extends $Family
    with $FunctionalFamilyOverride<VertexElement, (TripId, VertexRef)> {
  VertexUiElementFamily._()
    : super(
        retry: null,
        name: r'vertexUiElementProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexUiElementProvider call(TripId tripId, VertexRef vertexRef) =>
      VertexUiElementProvider._(argument: (tripId, vertexRef), from: this);

  @override
  String toString() => r'vertexUiElementProvider';
}

@ProviderFor(isVertexSelected)
final isVertexSelectedProvider = IsVertexSelectedFamily._();

final class IsVertexSelectedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsVertexSelectedProvider._({
    required IsVertexSelectedFamily super.from,
    required (TripId, VertexRef) super.argument,
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
    final argument = this.argument as (TripId, VertexRef);
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

String _$isVertexSelectedHash() => r'cf6fda209e717ae768ca43e4337475918246a3ac';

final class IsVertexSelectedFamily extends $Family
    with $FunctionalFamilyOverride<bool, (TripId, VertexRef)> {
  IsVertexSelectedFamily._()
    : super(
        retry: null,
        name: r'isVertexSelectedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsVertexSelectedProvider call(TripId tripId, VertexRef vertexRef) =>
      IsVertexSelectedProvider._(argument: (tripId, vertexRef), from: this);

  @override
  String toString() => r'isVertexSelectedProvider';
}
