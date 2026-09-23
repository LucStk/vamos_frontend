// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topology_projecter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'57dface2b1ce8cd381b1d5a13ef46ae78d431208';

final class AllVertexProjectionFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedPoint<MapPoint>>, TripId> {
  AllVertexProjectionFamily._()
    : super(
        retry: null,
        name: r'allVertexProjectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
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
    r'b6e96bdbf76979047b714722a2921e211c600370';

final class AllSegmentProjectionFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedLine<MapLine>>, TripId> {
  AllSegmentProjectionFamily._()
    : super(
        retry: null,
        name: r'allSegmentProjectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllSegmentProjectionProvider call(TripId tripId) =>
      AllSegmentProjectionProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allSegmentProjectionProvider';
}
