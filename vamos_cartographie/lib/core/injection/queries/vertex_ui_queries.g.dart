// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertexUiIds)
final vertexUiIdsProvider = VertexUiIdsProvider._();

final class VertexUiIdsProvider
    extends
        $FunctionalProvider<
          List<VertexUiId>,
          List<VertexUiId>,
          List<VertexUiId>
        >
    with $Provider<List<VertexUiId>> {
  VertexUiIdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexUiIdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexUiIdsHash();

  @$internal
  @override
  $ProviderElement<List<VertexUiId>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<VertexUiId> create(Ref ref) {
    return vertexUiIds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VertexUiId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VertexUiId>>(value),
    );
  }
}

String _$vertexUiIdsHash() => r'affe161f673ae40cb16f6b280f4cd13ed5379d16';

@ProviderFor(vertexUi)
final vertexUiProvider = VertexUiFamily._();

final class VertexUiProvider
    extends $FunctionalProvider<VertexUi?, VertexUi?, VertexUi?>
    with $Provider<VertexUi?> {
  VertexUiProvider._({
    required VertexUiFamily super.from,
    required VertexUiId super.argument,
  }) : super(
         retry: null,
         name: r'vertexUiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexUiHash();

  @override
  String toString() {
    return r'vertexUiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<VertexUi?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexUi? create(Ref ref) {
    final argument = this.argument as VertexUiId;
    return vertexUi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexUi? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexUi?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexUiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexUiHash() => r'30a0f1d31f8bbdb706dd5e7cf6e806d404a5c10a';

final class VertexUiFamily extends $Family
    with $FunctionalFamilyOverride<VertexUi?, VertexUiId> {
  VertexUiFamily._()
    : super(
        retry: null,
        name: r'vertexUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexUiProvider call(VertexUiId id) =>
      VertexUiProvider._(argument: id, from: this);

  @override
  String toString() => r'vertexUiProvider';
}
