// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_selectors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ─────────────────────────────────────────────
/// COLLECTION (structure-level)
/// rebuild uniquement si ajout / suppression
/// ─────────────────────────────────────────────

@ProviderFor(collectionListenable)
final collectionListenableProvider = CollectionListenableFamily._();

/// ─────────────────────────────────────────────
/// COLLECTION (structure-level)
/// rebuild uniquement si ajout / suppression
/// ─────────────────────────────────────────────

final class CollectionListenableProvider<T>
    extends
        $FunctionalProvider<
          ValueListenable<int>,
          ValueListenable<int>,
          ValueListenable<int>
        >
    with $Provider<ValueListenable<int>> {
  /// ─────────────────────────────────────────────
  /// COLLECTION (structure-level)
  /// rebuild uniquement si ajout / suppression
  /// ─────────────────────────────────────────────
  CollectionListenableProvider._({
    required CollectionListenableFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'collectionListenableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$collectionListenableHash();

  @override
  String toString() {
    return r'collectionListenableProvider'
        '<${T}>'
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ValueListenable<int>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<int> create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return collectionListenable<T>(ref, argument);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueListenable<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueListenable<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionListenableProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$collectionListenableHash() =>
    r'86f8561f6a1f6aa86dc4189c77c39d1065e23c03';

/// ─────────────────────────────────────────────
/// COLLECTION (structure-level)
/// rebuild uniquement si ajout / suppression
/// ─────────────────────────────────────────────

final class CollectionListenableFamily extends $Family {
  CollectionListenableFamily._()
    : super(
        retry: null,
        name: r'collectionListenableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ─────────────────────────────────────────────
  /// COLLECTION (structure-level)
  /// rebuild uniquement si ajout / suppression
  /// ─────────────────────────────────────────────

  CollectionListenableProvider<T> call<T>(Id<Trip> tripId) =>
      CollectionListenableProvider<T>._(argument: tripId, from: this);

  @override
  String toString() => r'collectionListenableProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    ValueListenable<int> Function<T>(Ref ref, Id<Trip> args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as CollectionListenableProvider;
      return provider._captureGenerics(<T>() {
        provider as CollectionListenableProvider<T>;
        final argument = provider.argument as Id<Trip>;
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

@ProviderFor(collection)
final collectionProvider = CollectionFamily._();

final class CollectionProvider<T>
    extends $FunctionalProvider<Map<Id<T>, T>, Map<Id<T>, T>, Map<Id<T>, T>>
    with $Provider<Map<Id<T>, T>> {
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

String _$collectionHash() => r'3cce312fc7a8676f73bec23d80c152b84240a886';

final class CollectionFamily extends $Family {
  CollectionFamily._()
    : super(
        retry: null,
        name: r'collectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

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

/// ─────────────────────────────────────────────
/// NODE (fine grain reactive entity)
/// rebuild uniquement si 1 entity change
/// ─────────────────────────────────────────────

@ProviderFor(nodeListenable)
final nodeListenableProvider = NodeListenableFamily._();

/// ─────────────────────────────────────────────
/// NODE (fine grain reactive entity)
/// rebuild uniquement si 1 entity change
/// ─────────────────────────────────────────────

final class NodeListenableProvider<T>
    extends
        $FunctionalProvider<
          ValueListenable<int>?,
          ValueListenable<int>?,
          ValueListenable<int>?
        >
    with $Provider<ValueListenable<int>?> {
  /// ─────────────────────────────────────────────
  /// NODE (fine grain reactive entity)
  /// rebuild uniquement si 1 entity change
  /// ─────────────────────────────────────────────
  NodeListenableProvider._({
    required NodeListenableFamily super.from,
    required (Id<Trip>, Id<T>) super.argument,
  }) : super(
         retry: null,
         name: r'nodeListenableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nodeListenableHash();

  @override
  String toString() {
    return r'nodeListenableProvider'
        '<${T}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ValueListenable<int>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<int>? create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<T>);
    return nodeListenable<T>(ref, argument.$1, argument.$2);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ValueListenable<int>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ValueListenable<int>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeListenableProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$nodeListenableHash() => r'a23b6553fd2e374c2ce8b1420a83e515b054117c';

/// ─────────────────────────────────────────────
/// NODE (fine grain reactive entity)
/// rebuild uniquement si 1 entity change
/// ─────────────────────────────────────────────

final class NodeListenableFamily extends $Family {
  NodeListenableFamily._()
    : super(
        retry: null,
        name: r'nodeListenableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ─────────────────────────────────────────────
  /// NODE (fine grain reactive entity)
  /// rebuild uniquement si 1 entity change
  /// ─────────────────────────────────────────────

  NodeListenableProvider<T> call<T>(Id<Trip> tripId, Id<T> id) =>
      NodeListenableProvider<T>._(argument: (tripId, id), from: this);

  @override
  String toString() => r'nodeListenableProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    ValueListenable<int>? Function<T>(Ref ref, (Id<Trip>, Id<T>) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as NodeListenableProvider;
      return provider._captureGenerics(<T>() {
        provider as NodeListenableProvider<T>;
        final argument = provider.argument as (Id<Trip>, Id<T>);
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

@ProviderFor(node)
final nodeProvider = NodeFamily._();

final class NodeProvider<T> extends $FunctionalProvider<T?, T?, T?>
    with $Provider<T?> {
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

String _$nodeHash() => r'57a09a7aa46102cd4807dad724444ee683057d13';

final class NodeFamily extends $Family {
  NodeFamily._()
    : super(
        retry: null,
        name: r'nodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

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

/// ─────────────────────────────────────────────
/// OPTIONAL: safe required node (throw if missing)
/// ─────────────────────────────────────────────

@ProviderFor(nodeRequired)
final nodeRequiredProvider = NodeRequiredFamily._();

/// ─────────────────────────────────────────────
/// OPTIONAL: safe required node (throw if missing)
/// ─────────────────────────────────────────────

final class NodeRequiredProvider<T> extends $FunctionalProvider<T, T, T>
    with $Provider<T> {
  /// ─────────────────────────────────────────────
  /// OPTIONAL: safe required node (throw if missing)
  /// ─────────────────────────────────────────────
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

String _$nodeRequiredHash() => r'4fd37f6cdb493882e348d8d1f51ac64471ae093c';

/// ─────────────────────────────────────────────
/// OPTIONAL: safe required node (throw if missing)
/// ─────────────────────────────────────────────

final class NodeRequiredFamily extends $Family {
  NodeRequiredFamily._()
    : super(
        retry: null,
        name: r'nodeRequiredProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ─────────────────────────────────────────────
  /// OPTIONAL: safe required node (throw if missing)
  /// ─────────────────────────────────────────────

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

@ProviderFor(graphNode)
final graphNodeProvider = GraphNodeFamily._();

final class GraphNodeProvider<T>
    extends $FunctionalProvider<GraphNode<T>?, GraphNode<T>?, GraphNode<T>?>
    with $Provider<GraphNode<T>?> {
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

String _$graphNodeHash() => r'9ec9e8329779c1807bb828972bfa85f308cb043e';

final class GraphNodeFamily extends $Family {
  GraphNodeFamily._()
    : super(
        retry: null,
        name: r'graphNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

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
