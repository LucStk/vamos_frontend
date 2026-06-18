// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_selectors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ======================================================
/// COLLECTION
/// ======================================================

@ProviderFor(collection)
final collectionProvider = CollectionFamily._();

/// ======================================================
/// COLLECTION
/// ======================================================

final class CollectionProvider<T>
    extends $FunctionalProvider<Map<Id<T>, T>, Map<Id<T>, T>, Map<Id<T>, T>>
    with $Provider<Map<Id<T>, T>> {
  /// ======================================================
  /// COLLECTION
  /// ======================================================
  CollectionProvider._({
    required CollectionFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'collectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$collectionHash();

  @override
  String toString() {
    return r'collectionProvider'
        '<${T}>'
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<Id<T>, T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<Id<T>, T> create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return collection<T>(ref, argument);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<Id<T>, T> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<Id<T>, T>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$collectionHash() => r'f13af9fdbe7be54dc1fc1fccfcf7b7540e1eb302';

/// ======================================================
/// COLLECTION
/// ======================================================

final class CollectionFamily extends $Family {
  CollectionFamily._()
    : super(
        retry: null,
        name: r'collectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ======================================================
  /// COLLECTION
  /// ======================================================

  CollectionProvider<T> call<T>(Id<Trip> tripId) =>
      CollectionProvider<T>._(argument: tripId, from: this);

  @override
  String toString() => r'collectionProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    Map<Id<T>, T> Function<T>(Ref ref, Id<Trip> args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as CollectionProvider;
      return provider._captureGenerics(<T>() {
        provider as CollectionProvider<T>;
        final argument = provider.argument as Id<Trip>;
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

/// ======================================================
/// GRAPH NODE
/// Riverpod écoute directement le ChangeNotifier
/// ======================================================

@ProviderFor(graphNode)
final graphNodeProvider = GraphNodeFamily._();

/// ======================================================
/// GRAPH NODE
/// Riverpod écoute directement le ChangeNotifier
/// ======================================================

final class GraphNodeProvider<T>
    extends $FunctionalProvider<GraphNode<T>?, GraphNode<T>?, GraphNode<T>?>
    with $Provider<GraphNode<T>?> {
  /// ======================================================
  /// GRAPH NODE
  /// Riverpod écoute directement le ChangeNotifier
  /// ======================================================
  GraphNodeProvider._({
    required GraphNodeFamily super.from,
    required (Id<Trip>, Id<T>) super.argument,
  }) : super(
         retry: null,
         name: r'graphNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$graphNodeHash();

  @override
  String toString() {
    return r'graphNodeProvider'
        '<${T}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<T>?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GraphNode<T>? create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<T>);
    return graphNode<T>(ref, argument.$1, argument.$2);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<T>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<T>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GraphNodeProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$graphNodeHash() => r'4ce1760a252989e66e922f5dfd804a8126eae8f2';

/// ======================================================
/// GRAPH NODE
/// Riverpod écoute directement le ChangeNotifier
/// ======================================================

final class GraphNodeFamily extends $Family {
  GraphNodeFamily._()
    : super(
        retry: null,
        name: r'graphNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ======================================================
  /// GRAPH NODE
  /// Riverpod écoute directement le ChangeNotifier
  /// ======================================================

  GraphNodeProvider<T> call<T>(Id<Trip> tripId, Id<T> id) =>
      GraphNodeProvider<T>._(argument: (tripId, id), from: this);

  @override
  String toString() => r'graphNodeProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    GraphNode<T>? Function<T>(Ref ref, (Id<Trip>, Id<T>) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as GraphNodeProvider;
      return provider._captureGenerics(<T>() {
        provider as GraphNodeProvider<T>;
        final argument = provider.argument as (Id<Trip>, Id<T>);
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

/// ======================================================
/// NODE VALUE
/// ======================================================

@ProviderFor(node)
final nodeProvider = NodeFamily._();

/// ======================================================
/// NODE VALUE
/// ======================================================

final class NodeProvider<T> extends $FunctionalProvider<T?, T?, T?>
    with $Provider<T?> {
  /// ======================================================
  /// NODE VALUE
  /// ======================================================
  NodeProvider._({
    required NodeFamily super.from,
    required (Id<Trip>, Id<T>) super.argument,
  }) : super(
         retry: null,
         name: r'nodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nodeHash();

  @override
  String toString() {
    return r'nodeProvider'
        '<${T}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<T?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  T? create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<T>);
    return node<T>(ref, argument.$1, argument.$2);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(T? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<T?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$nodeHash() => r'5ab89e5166c37278d5cada4d7c05d5d891056e97';

/// ======================================================
/// NODE VALUE
/// ======================================================

final class NodeFamily extends $Family {
  NodeFamily._()
    : super(
        retry: null,
        name: r'nodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ======================================================
  /// NODE VALUE
  /// ======================================================

  NodeProvider<T> call<T>(Id<Trip> tripId, Id<T> id) =>
      NodeProvider<T>._(argument: (tripId, id), from: this);

  @override
  String toString() => r'nodeProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    T? Function<T>(Ref ref, (Id<Trip>, Id<T>) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as NodeProvider;
      return provider._captureGenerics(<T>() {
        provider as NodeProvider<T>;
        final argument = provider.argument as (Id<Trip>, Id<T>);
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

/// ======================================================
/// REQUIRED NODE
/// ======================================================

@ProviderFor(nodeRequired)
final nodeRequiredProvider = NodeRequiredFamily._();

/// ======================================================
/// REQUIRED NODE
/// ======================================================

final class NodeRequiredProvider<T> extends $FunctionalProvider<T, T, T>
    with $Provider<T> {
  /// ======================================================
  /// REQUIRED NODE
  /// ======================================================
  NodeRequiredProvider._({
    required NodeRequiredFamily super.from,
    required (Id<Trip>, Id<T>) super.argument,
  }) : super(
         retry: null,
         name: r'nodeRequiredProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nodeRequiredHash();

  @override
  String toString() {
    return r'nodeRequiredProvider'
        '<${T}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<T> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  T create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<T>);
    return nodeRequired<T>(ref, argument.$1, argument.$2);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(T value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<T>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeRequiredProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$nodeRequiredHash() => r'984518263f8bb0fa41925ca7250c94ad9179ce7c';

/// ======================================================
/// REQUIRED NODE
/// ======================================================

final class NodeRequiredFamily extends $Family {
  NodeRequiredFamily._()
    : super(
        retry: null,
        name: r'nodeRequiredProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ======================================================
  /// REQUIRED NODE
  /// ======================================================

  NodeRequiredProvider<T> call<T>(Id<Trip> tripId, Id<T> id) =>
      NodeRequiredProvider<T>._(argument: (tripId, id), from: this);

  @override
  String toString() => r'nodeRequiredProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    T Function<T>(Ref ref, (Id<Trip>, Id<T>) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as NodeRequiredProvider;
      return provider._captureGenerics(<T>() {
        provider as NodeRequiredProvider<T>;
        final argument = provider.argument as (Id<Trip>, Id<T>);
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}
