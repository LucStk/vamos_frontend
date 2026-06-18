// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_overlay_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SegmentOverlayNotifier)
final segmentOverlayProvider = SegmentOverlayNotifierFamily._();

final class SegmentOverlayNotifierProvider
    extends $NotifierProvider<SegmentOverlayNotifier, SegmentOverlay> {
  SegmentOverlayNotifierProvider._({
    required SegmentOverlayNotifierFamily super.from,
    required (Id<Trip>, Id<Segment>) super.argument,
  }) : super(
         retry: null,
         name: r'segmentOverlayProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$segmentOverlayNotifierHash();

  @override
  String toString() {
    return r'segmentOverlayProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SegmentOverlayNotifier create() => SegmentOverlayNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SegmentOverlay value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SegmentOverlay>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentOverlayNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$segmentOverlayNotifierHash() =>
    r'70185e37fd7b25ee62b0930403bdaac3e983f50d';

final class SegmentOverlayNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SegmentOverlayNotifier,
          SegmentOverlay,
          SegmentOverlay,
          SegmentOverlay,
          (Id<Trip>, Id<Segment>)
        > {
  SegmentOverlayNotifierFamily._()
    : super(
        retry: null,
        name: r'segmentOverlayProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SegmentOverlayNotifierProvider call(Id<Trip> tripId, Id<Segment> segmentId) =>
      SegmentOverlayNotifierProvider._(
        argument: (tripId, segmentId),
        from: this,
      );

  @override
  String toString() => r'segmentOverlayProvider';
}

abstract class _$SegmentOverlayNotifier extends $Notifier<SegmentOverlay> {
  late final _$args = ref.$arg as (Id<Trip>, Id<Segment>);
  Id<Trip> get tripId => _$args.$1;
  Id<Segment> get segmentId => _$args.$2;

  SegmentOverlay build(Id<Trip> tripId, Id<Segment> segmentId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SegmentOverlay, SegmentOverlay>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SegmentOverlay, SegmentOverlay>,
              SegmentOverlay,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
