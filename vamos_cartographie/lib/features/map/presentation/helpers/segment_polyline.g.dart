// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_polyline.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(segmentPolyline)
final segmentPolylineProvider = SegmentPolylineFamily._();

final class SegmentPolylineProvider
    extends
        $FunctionalProvider<
          Polyline<Object>?,
          Polyline<Object>?,
          Polyline<Object>?
        >
    with $Provider<Polyline<Object>?> {
  SegmentPolylineProvider._({
    required SegmentPolylineFamily super.from,
    required (Id<Trip>, Id<Segment>) super.argument,
  }) : super(
         retry: null,
         name: r'segmentPolylineProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentPolylineHash();

  @override
  String toString() {
    return r'segmentPolylineProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Polyline<Object>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Polyline<Object>? create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<Segment>);
    return segmentPolyline(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Polyline<Object>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Polyline<Object>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentPolylineProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentPolylineHash() => r'339be8908dbda7e0ff9351f1001ab07d8d81df93';

final class SegmentPolylineFamily extends $Family
    with $FunctionalFamilyOverride<Polyline<Object>?, (Id<Trip>, Id<Segment>)> {
  SegmentPolylineFamily._()
    : super(
        retry: null,
        name: r'segmentPolylineProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentPolylineProvider call(Id<Trip> tripId, Id<Segment> segmentId) =>
      SegmentPolylineProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentPolylineProvider';
}
