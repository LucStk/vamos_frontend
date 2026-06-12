// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_selectors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ─────────────────────────────────────────────
/// COLLECTION (list / map / layers)
/// Rebuild uniquement si structure change
/// ─────────────────────────────────────────────

@ProviderFor(collectionListenable)
final collectionListenableProvider = CollectionListenableFamily._();

/// ─────────────────────────────────────────────
/// COLLECTION (list / map / layers)
/// Rebuild uniquement si structure change
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
  /// COLLECTION (list / map / layers)
  /// Rebuild uniquement si structure change
  /// ─────────────────────────────────────────────
  CollectionListenableProvider._({
    required CollectionListenableFamily super.from,
  }) : super(
         argument: null,
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
        '()';
  }

  @$internal
  @override
  $ProviderElement<ValueListenable<int>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ValueListenable<int> create(Ref ref) {
    return collectionListenable<T>(ref);
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
    r'e2d3e68b8e8ad286e7c62dc8c46421f88977da67';

/// ─────────────────────────────────────────────
/// COLLECTION (list / map / layers)
/// Rebuild uniquement si structure change
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
  /// COLLECTION (list / map / layers)
  /// Rebuild uniquement si structure change
  /// ─────────────────────────────────────────────

  CollectionListenableProvider<T> call<T>() =>
      CollectionListenableProvider<T>._(from: this);

  @override
  String toString() => r'collectionListenableProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(ValueListenable<int> Function<T>(Ref ref) create) =>
      $FamilyOverride(
        from: this,
        createElement: (pointer) {
          final provider = pointer.origin as CollectionListenableProvider;
          return provider._captureGenerics(<T>() {
            provider as CollectionListenableProvider<T>;
            return provider.$view(create: create<T>).$createElement(pointer);
          });
        },
      );
}

@ProviderFor(collection)
final collectionProvider = CollectionFamily._();

final class CollectionProvider<T>
    extends $FunctionalProvider<Map<int, T>, Map<int, T>, Map<int, T>>
    with $Provider<Map<int, T>> {
  CollectionProvider._({required CollectionFamily super.from})
    : super(
        argument: null,
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
        '()';
  }

  @$internal
  @override
  $ProviderElement<Map<int, T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<int, T> create(Ref ref) {
    return collection<T>(ref);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, T> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, T>>(value),
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

String _$collectionHash() => r'ae7ddae4d6c557e92ba0ba41b3b22e1eff39d5b0';

final class CollectionFamily extends $Family {
  CollectionFamily._()
    : super(
        retry: null,
        name: r'collectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CollectionProvider<T> call<T>() => CollectionProvider<T>._(from: this);

  @override
  String toString() => r'collectionProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(Map<int, T> Function<T>(Ref ref) create) =>
      $FamilyOverride(
        from: this,
        createElement: (pointer) {
          final provider = pointer.origin as CollectionProvider;
          return provider._captureGenerics(<T>() {
            provider as CollectionProvider<T>;
            return provider.$view(create: create<T>).$createElement(pointer);
          });
        },
      );
}
