// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VerticesNotifier)
final verticesProvider = VerticesNotifierFamily._();

final class VerticesNotifierProvider
    extends $AsyncNotifierProvider<VerticesNotifier, Map<int, Vertex>> {
  VerticesNotifierProvider._({
    required VerticesNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'verticesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$verticesNotifierHash();

  @override
  String toString() {
    return r'verticesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  VerticesNotifier create() => VerticesNotifier();

  @override
  bool operator ==(Object other) {
    return other is VerticesNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$verticesNotifierHash() => r'ca63d2dc244b816af012b26f92e8b9b11b6b4867';

final class VerticesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          VerticesNotifier,
          AsyncValue<Map<int, Vertex>>,
          Map<int, Vertex>,
          FutureOr<Map<int, Vertex>>,
          int
        > {
  VerticesNotifierFamily._()
    : super(
        retry: null,
        name: r'verticesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VerticesNotifierProvider call(int tripId) =>
      VerticesNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'verticesProvider';
}

abstract class _$VerticesNotifier extends $AsyncNotifier<Map<int, Vertex>> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  FutureOr<Map<int, Vertex>> build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Map<int, Vertex>>, Map<int, Vertex>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Map<int, Vertex>>, Map<int, Vertex>>,
              AsyncValue<Map<int, Vertex>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(vertexMap)
final vertexMapProvider = VertexMapFamily._();

final class VertexMapProvider
    extends
        $FunctionalProvider<
          Map<int, Vertex>,
          Map<int, Vertex>,
          Map<int, Vertex>
        >
    with $Provider<Map<int, Vertex>> {
  VertexMapProvider._({
    required VertexMapFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'vertexMapProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexMapHash();

  @override
  String toString() {
    return r'vertexMapProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<int, Vertex>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<int, Vertex> create(Ref ref) {
    final argument = this.argument as int;
    return vertexMap(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, Vertex> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, Vertex>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexMapProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexMapHash() => r'ba85abcc98a10afd675bde02e350c55aaae82e8f';

final class VertexMapFamily extends $Family
    with $FunctionalFamilyOverride<Map<int, Vertex>, int> {
  VertexMapFamily._()
    : super(
        retry: null,
        name: r'vertexMapProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexMapProvider call(int tripId) =>
      VertexMapProvider._(argument: tripId, from: this);

  @override
  String toString() => r'vertexMapProvider';
}

@ProviderFor(vertexIds)
final vertexIdsProvider = VertexIdsFamily._();

final class VertexIdsProvider
    extends $FunctionalProvider<Iterable<int>, Iterable<int>, Iterable<int>>
    with $Provider<Iterable<int>> {
  VertexIdsProvider._({
    required VertexIdsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'vertexIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexIdsHash();

  @override
  String toString() {
    return r'vertexIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Iterable<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Iterable<int> create(Ref ref) {
    final argument = this.argument as int;
    return vertexIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexIdsHash() => r'12123b0605dc459f1e6b7c46efc312625f543f63';

final class VertexIdsFamily extends $Family
    with $FunctionalFamilyOverride<Iterable<int>, int> {
  VertexIdsFamily._()
    : super(
        retry: null,
        name: r'vertexIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexIdsProvider call(int tripId) =>
      VertexIdsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'vertexIdsProvider';
}

@ProviderFor(vertexById)
final vertexByIdProvider = VertexByIdFamily._();

final class VertexByIdProvider
    extends $FunctionalProvider<Vertex?, Vertex?, Vertex?>
    with $Provider<Vertex?> {
  VertexByIdProvider._({
    required VertexByIdFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'vertexByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexByIdHash();

  @override
  String toString() {
    return r'vertexByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Vertex?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Vertex? create(Ref ref) {
    final argument = this.argument as (int, int);
    return vertexById(ref, argument.$1, argument.$2);
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
    return other is VertexByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexByIdHash() => r'22d4e9019ccdfbb45042777e911e8529c4e51a92';

final class VertexByIdFamily extends $Family
    with $FunctionalFamilyOverride<Vertex?, (int, int)> {
  VertexByIdFamily._()
    : super(
        retry: null,
        name: r'vertexByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexByIdProvider call(int tripId, int vertexId) =>
      VertexByIdProvider._(argument: (tripId, vertexId), from: this);

  @override
  String toString() => r'vertexByIdProvider';
}
