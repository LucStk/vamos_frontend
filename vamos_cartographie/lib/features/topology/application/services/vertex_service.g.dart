// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertexService)
final vertexServiceProvider = VertexServiceProvider._();

final class VertexServiceProvider
    extends $FunctionalProvider<VertexService, VertexService, VertexService>
    with $Provider<VertexService> {
  VertexServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexServiceHash();

  @$internal
  @override
  $ProviderElement<VertexService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexService create(Ref ref) {
    return vertexService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexService>(value),
    );
  }
}

String _$vertexServiceHash() => r'e3269b3e69072aa1c378e5cf30a0733b0ca35938';
