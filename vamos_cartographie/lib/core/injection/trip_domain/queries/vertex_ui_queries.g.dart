// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$vertexRefsHash() => r'a70b347e7906adfbf2a859b8ab5531c949cc1e81';

@ProviderFor(vertexUi)
final vertexUiProvider = VertexUiFamily._();

final class VertexUiProvider
    extends $FunctionalProvider<VertexUiModel?, VertexUiModel?, VertexUiModel?>
    with $Provider<VertexUiModel?> {
  VertexUiProvider._({
    required VertexUiFamily super.from,
    required VertexRef super.argument,
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
  $ProviderElement<VertexUiModel?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexUiModel? create(Ref ref) {
    final argument = this.argument as VertexRef;
    return vertexUi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexUiModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexUiModel?>(value),
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

String _$vertexUiHash() => r'84627b39206876656a2ed307c6c030425fafb189';

final class VertexUiFamily extends $Family
    with $FunctionalFamilyOverride<VertexUiModel?, VertexRef> {
  VertexUiFamily._()
    : super(
        retry: null,
        name: r'vertexUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexUiProvider call(VertexRef id) =>
      VertexUiProvider._(argument: id, from: this);

  @override
  String toString() => r'vertexUiProvider';
}
