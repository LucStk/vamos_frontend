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

String _$vertexRefsHash() => r'51dfa2b46d169ec6e21fc3d83d5e184629dff146';

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

String _$vertexUiHash() => r'83d5bd7f266da6b1b02b25f2055417e820ae0776';

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

@ProviderFor(vertexMarkers)
final vertexMarkersProvider = VertexMarkersFamily._();

final class VertexMarkersProvider
    extends
        $FunctionalProvider<
          List<DragMarker>,
          List<DragMarker>,
          List<DragMarker>
        >
    with $Provider<List<DragMarker>> {
  VertexMarkersProvider._({
    required VertexMarkersFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'vertexMarkersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexMarkersHash();

  @override
  String toString() {
    return r'vertexMarkersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<DragMarker>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<DragMarker> create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return vertexMarkers(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DragMarker> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DragMarker>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexMarkersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexMarkersHash() => r'27818fb656a3690cfe25cfd6cfc69c5a38fff7ba';

final class VertexMarkersFamily extends $Family
    with $FunctionalFamilyOverride<List<DragMarker>, Id<Trip>> {
  VertexMarkersFamily._()
    : super(
        retry: null,
        name: r'vertexMarkersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexMarkersProvider call(Id<Trip> tripId) =>
      VertexMarkersProvider._(argument: tripId, from: this);

  @override
  String toString() => r'vertexMarkersProvider';
}
