// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_segment_projection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resolvedMarkerSegment)
final resolvedMarkerSegmentProvider = ResolvedMarkerSegmentFamily._();

final class ResolvedMarkerSegmentProvider
    extends $FunctionalProvider<LatLng, LatLng, LatLng>
    with $Provider<LatLng> {
  ResolvedMarkerSegmentProvider._({
    required ResolvedMarkerSegmentFamily super.from,
    required (Id<Trip>, Id<Segment>) super.argument,
  }) : super(
         retry: null,
         name: r'resolvedMarkerSegmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$resolvedMarkerSegmentHash();

  @override
  String toString() {
    return r'resolvedMarkerSegmentProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<LatLng> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LatLng create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<Segment>);
    return resolvedMarkerSegment(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LatLng value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LatLng>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ResolvedMarkerSegmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$resolvedMarkerSegmentHash() =>
    r'e2dc18b102904b83b7fcae2f118a0be7ada4c731';

final class ResolvedMarkerSegmentFamily extends $Family
    with $FunctionalFamilyOverride<LatLng, (Id<Trip>, Id<Segment>)> {
  ResolvedMarkerSegmentFamily._()
    : super(
        retry: null,
        name: r'resolvedMarkerSegmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ResolvedMarkerSegmentProvider call(Id<Trip> tripId, Id<Segment> segmentId) =>
      ResolvedMarkerSegmentProvider._(
        argument: (tripId, segmentId),
        from: this,
      );

  @override
  String toString() => r'resolvedMarkerSegmentProvider';
}
