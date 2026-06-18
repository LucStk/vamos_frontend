// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_derived_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resolvedSegmentGeometry)
final resolvedSegmentGeometryProvider = ResolvedSegmentGeometryFamily._();

final class ResolvedSegmentGeometryProvider
    extends $FunctionalProvider<List<LatLng>, List<LatLng>, List<LatLng>>
    with $Provider<List<LatLng>> {
  ResolvedSegmentGeometryProvider._({
    required ResolvedSegmentGeometryFamily super.from,
    required (Id<Trip>, Id<Segment>) super.argument,
  }) : super(
         retry: null,
         name: r'resolvedSegmentGeometryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resolvedSegmentGeometryHash();

  @override
  String toString() {
    return r'resolvedSegmentGeometryProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<LatLng>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<LatLng> create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<Segment>);
    return resolvedSegmentGeometry(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<LatLng> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<LatLng>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ResolvedSegmentGeometryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resolvedSegmentGeometryHash() =>
    r'ac9443f2187aac0693d27480bd0c74c65018394e';

final class ResolvedSegmentGeometryFamily extends $Family
    with $FunctionalFamilyOverride<List<LatLng>, (Id<Trip>, Id<Segment>)> {
  ResolvedSegmentGeometryFamily._()
    : super(
        retry: null,
        name: r'resolvedSegmentGeometryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResolvedSegmentGeometryProvider call(
    Id<Trip> tripId,
    Id<Segment> segmentId,
  ) => ResolvedSegmentGeometryProvider._(
    argument: (tripId, segmentId),
    from: this,
  );

  @override
  String toString() => r'resolvedSegmentGeometryProvider';
}
