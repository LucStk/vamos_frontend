// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_selectors.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(query)
final queryProvider = QueryFamily._();

final class QueryProvider<T>
    extends $FunctionalProvider<List<T>, List<T>, List<T>>
    with $Provider<List<T>> {
  QueryProvider._({
    required QueryFamily super.from,
    required (dynamic, bool Function(T entity)) super.argument,
  }) : super(
         retry: null,
         name: r'queryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queryHash();

  @override
  String toString() {
    return r'queryProvider'
        '<${T}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<T> create(Ref ref) {
    final argument = this.argument as (dynamic, bool Function(T entity));
    return query<T>(ref, argument.$1, argument.$2);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<T> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<T>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QueryProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$queryHash() => r'c047183e48060374750c91a20daf9cd9e1efa605';

final class QueryFamily extends $Family {
  QueryFamily._()
    : super(
        retry: null,
        name: r'queryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QueryProvider<T> call<T>(dynamic tripId, bool Function(T entity) predicate) =>
      QueryProvider<T>._(argument: (tripId, predicate), from: this);

  @override
  String toString() => r'queryProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    List<T> Function<T>(Ref ref, (dynamic, bool Function(T entity)) args)
    create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as QueryProvider;
      return provider._captureGenerics(<T>() {
        provider as QueryProvider<T>;
        final argument =
            provider.argument as (dynamic, bool Function(T entity));
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

@ProviderFor(indexedBy)
final indexedByProvider = IndexedByFamily._();

final class IndexedByProvider<T, K>
    extends
        $FunctionalProvider<Map<K, List<T>>, Map<K, List<T>>, Map<K, List<T>>>
    with $Provider<Map<K, List<T>>> {
  IndexedByProvider._({
    required IndexedByFamily super.from,
    required (int, K Function(T entity)) super.argument,
  }) : super(
         retry: null,
         name: r'indexedByProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$indexedByHash();

  @override
  String toString() {
    return r'indexedByProvider'
        '<${T}, ${K}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Map<K, List<T>>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<K, List<T>> create(Ref ref) {
    final argument = this.argument as (int, K Function(T entity));
    return indexedBy<T, K>(ref, argument.$1, argument.$2);
  }

  $R _captureGenerics<$R>($R Function<T, K>() cb) {
    return cb<T, K>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<K, List<T>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<K, List<T>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IndexedByProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$indexedByHash() => r'12ca83bf7feafd181c732ec4bc475dac1c752d63';

final class IndexedByFamily extends $Family {
  IndexedByFamily._()
    : super(
        retry: null,
        name: r'indexedByProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IndexedByProvider<T, K> call<T, K>(
    int tripId,
    K Function(T entity) keySelector,
  ) => IndexedByProvider<T, K>._(argument: (tripId, keySelector), from: this);

  @override
  String toString() => r'indexedByProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    Map<K, List<T>> Function<T, K>(Ref ref, (int, K Function(T entity)) args)
    create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as IndexedByProvider;
      return provider._captureGenerics(<T, K>() {
        provider as IndexedByProvider<T, K>;
        final argument = provider.argument as (int, K Function(T entity));
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}

@ProviderFor(queryLive)
final queryLiveProvider = QueryLiveFamily._();

final class QueryLiveProvider<T>
    extends $FunctionalProvider<List<T>, List<T>, List<T>>
    with $Provider<List<T>> {
  QueryLiveProvider._({
    required QueryLiveFamily super.from,
    required (int, bool Function(T entity)) super.argument,
  }) : super(
         retry: null,
         name: r'queryLiveProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queryLiveHash();

  @override
  String toString() {
    return r'queryLiveProvider'
        '<${T}>'
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<T> create(Ref ref) {
    final argument = this.argument as (int, bool Function(T entity));
    return queryLive<T>(ref, argument.$1, argument.$2);
  }

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<T> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<T>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QueryLiveProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$queryLiveHash() => r'352ecfba7440803ef8ff2c5c7cacdce4f3edde4c';

final class QueryLiveFamily extends $Family {
  QueryLiveFamily._()
    : super(
        retry: null,
        name: r'queryLiveProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QueryLiveProvider<T> call<T>(int tripId, bool Function(T entity) predicate) =>
      QueryLiveProvider<T>._(argument: (tripId, predicate), from: this);

  @override
  String toString() => r'queryLiveProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    List<T> Function<T>(Ref ref, (int, bool Function(T entity)) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as QueryLiveProvider;
      return provider._captureGenerics(<T>() {
        provider as QueryLiveProvider<T>;
        final argument = provider.argument as (int, bool Function(T entity));
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}
