// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topology_projecter.dart';

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

@ProviderFor(allVertexProjection)
final allVertexProjectionProvider = AllVertexProjectionFamily._();

final class AllVertexProjectionProvider
    extends
        $FunctionalProvider<
          List<ProjectedPoint<MapPoint>>,
          List<ProjectedPoint<MapPoint>>,
          List<ProjectedPoint<MapPoint>>
        >
    with $Provider<List<ProjectedPoint<MapPoint>>> {
  AllVertexProjectionProvider._({
    required AllVertexProjectionFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allVertexProjectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = cameraOrNullProvider;
  static final $allTransitiveDependencies1 = vertexDataProvider;

  @override
  String debugGetCreateSourceHash() => _$allVertexProjectionHash();

  @override
  String toString() {
    return r'allVertexProjectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ProjectedPoint<MapPoint>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedPoint<MapPoint>> create(Ref ref) {
    final argument = this.argument as TripId;
    return allVertexProjection(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedPoint<MapPoint>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedPoint<MapPoint>>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllVertexProjectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allVertexProjectionHash() =>
    r'd78226f43069e6daa4be2b4c769be17e6b6d110f';

final class AllVertexProjectionFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedPoint<MapPoint>>, TripId> {
  AllVertexProjectionFamily._()
    : super(
        retry: null,
        name: r'allVertexProjectionProvider',
        dependencies: <ProviderOrFamily>[
          cameraOrNullProvider,
          vertexDataProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          AllVertexProjectionProvider.$allTransitiveDependencies0,
          AllVertexProjectionProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: true,
      );

  AllVertexProjectionProvider call(TripId tripId) =>
      AllVertexProjectionProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allVertexProjectionProvider';
}

@ProviderFor(allSegmentProjection)
final allSegmentProjectionProvider = AllSegmentProjectionFamily._();

final class AllSegmentProjectionProvider
    extends
        $FunctionalProvider<
          List<ProjectedLine<MapLine>>,
          List<ProjectedLine<MapLine>>,
          List<ProjectedLine<MapLine>>
        >
    with $Provider<List<ProjectedLine<MapLine>>> {
  AllSegmentProjectionProvider._({
    required AllSegmentProjectionFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allSegmentProjectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = cameraOrNullProvider;

  @override
  String debugGetCreateSourceHash() => _$allSegmentProjectionHash();

  @override
  String toString() {
    return r'allSegmentProjectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ProjectedLine<MapLine>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedLine<MapLine>> create(Ref ref) {
    final argument = this.argument as TripId;
    return allSegmentProjection(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedLine<MapLine>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedLine<MapLine>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllSegmentProjectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allSegmentProjectionHash() =>
    r'9b078cda579b180cc4f6fbbfe0904bed2e9bc57b';

final class AllSegmentProjectionFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedLine<MapLine>>, TripId> {
  AllSegmentProjectionFamily._()
    : super(
        retry: null,
        name: r'allSegmentProjectionProvider',
        dependencies: <ProviderOrFamily>[cameraOrNullProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          AllSegmentProjectionProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: true,
      );

  AllSegmentProjectionProvider call(TripId tripId) =>
      AllSegmentProjectionProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allSegmentProjectionProvider';
}
