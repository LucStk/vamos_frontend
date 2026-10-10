// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertexData)
final vertexDataProvider = VertexDataFamily._();

final class VertexDataProvider
    extends
        $FunctionalProvider<
          ({VertexVisualKind kind, LatLng position}),
          ({VertexVisualKind kind, LatLng position}),
          ({VertexVisualKind kind, LatLng position})
        >
    with $Provider<({VertexVisualKind kind, LatLng position})> {
  VertexDataProvider._({
    required VertexDataFamily super.from,
    required (TripId, VertexId) super.argument,
  }) : super(
         retry: null,
         name: r'vertexDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexDataHash();

  @override
  String toString() {
    return r'vertexDataProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<({VertexVisualKind kind, LatLng position})> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ({VertexVisualKind kind, LatLng position}) create(Ref ref) {
    final argument = this.argument as (TripId, VertexId);
    return vertexData(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({VertexVisualKind kind, LatLng position}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<({VertexVisualKind kind, LatLng position})>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexDataHash() => r'3641db2eb9e4b46458349b8b8ecca4bd2cd6902f';

final class VertexDataFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ({VertexVisualKind kind, LatLng position}),
          (TripId, VertexId)
        > {
  VertexDataFamily._()
    : super(
        retry: null,
        name: r'vertexDataProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: true,
      );

  VertexDataProvider call(TripId tripId, VertexId vertexId) =>
      VertexDataProvider._(argument: (tripId, vertexId), from: this);

  @override
  String toString() => r'vertexDataProvider';
}

@ProviderFor(vertexItem)
final vertexItemProvider = VertexItemFamily._();

final class VertexItemProvider
    extends $FunctionalProvider<VertexItem, VertexItem, VertexItem>
    with $Provider<VertexItem> {
  VertexItemProvider._({
    required VertexItemFamily super.from,
    required (TripId, VertexId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'vertexItemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = vertexDataProvider;

  @override
  String debugGetCreateSourceHash() => _$vertexItemHash();

  @override
  String toString() {
    return r'vertexItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<VertexItem> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexItem create(Ref ref) {
    final argument = this.argument as (TripId, VertexId, MapCameraReader);
    return vertexItem(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexItem value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexItem>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexItemHash() => r'da550810aff39383a434d94c5e0ed7323083de25';

final class VertexItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          VertexItem,
          (TripId, VertexId, MapCameraReader)
        > {
  VertexItemFamily._()
    : super(
        retry: null,
        name: r'vertexItemProvider',
        dependencies: <ProviderOrFamily>[vertexDataProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          VertexItemProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: true,
      );

  VertexItemProvider call(
    TripId tripId,
    VertexId id,
    MapCameraReader cameraReader,
  ) => VertexItemProvider._(argument: (tripId, id, cameraReader), from: this);

  @override
  String toString() => r'vertexItemProvider';
}
