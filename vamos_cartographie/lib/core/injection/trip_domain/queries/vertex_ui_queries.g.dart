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

String _$vertexRefsHash() => r'fa3d295c0747af9cd14dd37bd742b9c17de1cd1d';

@ProviderFor(vertexUiElement)
final vertexUiElementProvider = VertexUiElementFamily._();

final class VertexUiElementProvider
    extends
        $FunctionalProvider<
          DragMarkerUiElement,
          DragMarkerUiElement,
          DragMarkerUiElement
        >
    with $Provider<DragMarkerUiElement> {
  VertexUiElementProvider._({
    required VertexUiElementFamily super.from,
    required (TripId, VertexRef) super.argument,
  }) : super(
         retry: null,
         name: r'vertexUiElementProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexUiElementHash();

  @override
  String toString() {
    return r'vertexUiElementProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<DragMarkerUiElement> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DragMarkerUiElement create(Ref ref) {
    final argument = this.argument as (TripId, VertexRef);
    return vertexUiElement(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DragMarkerUiElement value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DragMarkerUiElement>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexUiElementProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexUiElementHash() => r'7603f2caa8570628646147ce2dbdd4f4ace82bd3';

final class VertexUiElementFamily extends $Family
    with $FunctionalFamilyOverride<DragMarkerUiElement, (TripId, VertexRef)> {
  VertexUiElementFamily._()
    : super(
        retry: null,
        name: r'vertexUiElementProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexUiElementProvider call(TripId tripId, VertexRef vertexRef) =>
      VertexUiElementProvider._(argument: (tripId, vertexRef), from: this);

  @override
  String toString() => r'vertexUiElementProvider';
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

String _$vertexMarkersHash() => r'f7b0784c68de557b06f961de2fc243195212a56e';

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
