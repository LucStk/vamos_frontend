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
    required bool Function(T entity) super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<T> create(Ref ref) {
    final argument = this.argument as bool Function(T entity);
    return query<T>(ref, argument);
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

String _$queryHash() => r'44f934c00e1cb606d04b97828470f4d5c67d4c6c';

final class QueryFamily extends $Family {
  QueryFamily._()
    : super(
        retry: null,
        name: r'queryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QueryProvider<T> call<T>(bool Function(T entity) predicate) =>
      QueryProvider<T>._(argument: predicate, from: this);

  @override
  String toString() => r'queryProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    List<T> Function<T>(Ref ref, bool Function(T entity) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as QueryProvider;
      return provider._captureGenerics(<T>() {
        provider as QueryProvider<T>;
        final argument = provider.argument as bool Function(T entity);
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
    required K Function(T entity) super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<K, List<T>>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<K, List<T>> create(Ref ref) {
    final argument = this.argument as K Function(T entity);
    return indexedBy<T, K>(ref, argument);
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

String _$indexedByHash() => r'9be86fdae051fd8ce79ecf7f47929c195d3cfbcf';

final class IndexedByFamily extends $Family {
  IndexedByFamily._()
    : super(
        retry: null,
        name: r'indexedByProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IndexedByProvider<T, K> call<T, K>(K Function(T entity) keySelector) =>
      IndexedByProvider<T, K>._(argument: keySelector, from: this);

  @override
  String toString() => r'indexedByProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    Map<K, List<T>> Function<T, K>(Ref ref, K Function(T entity) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as IndexedByProvider;
      return provider._captureGenerics(<T, K>() {
        provider as IndexedByProvider<T, K>;
        final argument = provider.argument as K Function(T entity);
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
    required bool Function(T entity) super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<T>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<T> create(Ref ref) {
    final argument = this.argument as bool Function(T entity);
    return queryLive<T>(ref, argument);
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

String _$queryLiveHash() => r'0627623c7d3df915daf7a018bbe487d612a312b5';

final class QueryLiveFamily extends $Family {
  QueryLiveFamily._()
    : super(
        retry: null,
        name: r'queryLiveProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QueryLiveProvider<T> call<T>(bool Function(T entity) predicate) =>
      QueryLiveProvider<T>._(argument: predicate, from: this);

  @override
  String toString() => r'queryLiveProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(
    List<T> Function<T>(Ref ref, bool Function(T entity) args) create,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as QueryLiveProvider;
      return provider._captureGenerics(<T>() {
        provider as QueryLiveProvider<T>;
        final argument = provider.argument as bool Function(T entity);
        return provider
            .$view(create: (ref) => create(ref, argument))
            .$createElement(pointer);
      });
    },
  );
}
