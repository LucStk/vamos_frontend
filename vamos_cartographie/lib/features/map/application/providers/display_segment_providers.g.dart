// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_segment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DisplaySegmentNotifier)
final displaySegmentProvider = DisplaySegmentNotifierFamily._();

final class DisplaySegmentNotifierProvider
    extends $NotifierProvider<DisplaySegmentNotifier, DisplaySegment> {
  DisplaySegmentNotifierProvider._({
    required DisplaySegmentNotifierFamily super.from,
    required (Id<Trip>, Id<Segment>) super.argument,
  }) : super(
         retry: null,
         name: r'displaySegmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$displaySegmentNotifierHash();

  @override
  String toString() {
    return r'displaySegmentProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DisplaySegmentNotifier create() => DisplaySegmentNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DisplaySegment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DisplaySegment>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DisplaySegmentNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$displaySegmentNotifierHash() =>
    r'bcfdc2a2d56797d21fd0d5f303c911c888a157c2';

final class DisplaySegmentNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DisplaySegmentNotifier,
          DisplaySegment,
          DisplaySegment,
          DisplaySegment,
          (Id<Trip>, Id<Segment>)
        > {
  DisplaySegmentNotifierFamily._()
    : super(
        retry: null,
        name: r'displaySegmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DisplaySegmentNotifierProvider call(Id<Trip> tripId, Id<Segment> segmentId) =>
      DisplaySegmentNotifierProvider._(
        argument: (tripId, segmentId),
        from: this,
      );

  @override
  String toString() => r'displaySegmentProvider';
}

abstract class _$DisplaySegmentNotifier extends $Notifier<DisplaySegment> {
  late final _$args = ref.$arg as (Id<Trip>, Id<Segment>);
  Id<Trip> get tripId => _$args.$1;
  Id<Segment> get segmentId => _$args.$2;

  DisplaySegment build(Id<Trip> tripId, Id<Segment> segmentId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DisplaySegment, DisplaySegment>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DisplaySegment, DisplaySegment>,
              DisplaySegment,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}

@ProviderFor(segmentMarkerLatLng)
final segmentMarkerLatLngProvider = SegmentMarkerLatLngFamily._();

final class SegmentMarkerLatLngProvider
    extends $FunctionalProvider<LatLng, LatLng, LatLng>
    with $Provider<LatLng> {
  SegmentMarkerLatLngProvider._({
    required SegmentMarkerLatLngFamily super.from,
    required (Id<Trip>, Id<Segment>) super.argument,
  }) : super(
         retry: null,
         name: r'segmentMarkerLatLngProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentMarkerLatLngHash();

  @override
  String toString() {
    return r'segmentMarkerLatLngProvider'
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
    return segmentMarkerLatLng(ref, argument.$1, argument.$2);
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
    return other is SegmentMarkerLatLngProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentMarkerLatLngHash() =>
    r'6949bb9053aec223203a2df22e36066b781b30bc';

final class SegmentMarkerLatLngFamily extends $Family
    with $FunctionalFamilyOverride<LatLng, (Id<Trip>, Id<Segment>)> {
  SegmentMarkerLatLngFamily._()
    : super(
        retry: null,
        name: r'segmentMarkerLatLngProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentMarkerLatLngProvider call(Id<Trip> tripId, Id<Segment> segmentId) =>
      SegmentMarkerLatLngProvider._(argument: (tripId, segmentId), from: this);

  @override
  String toString() => r'segmentMarkerLatLngProvider';
}
