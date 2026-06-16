// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_segment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DisplaySegmentProvider)
final displaySegmentProviderProvider = DisplaySegmentProviderFamily._();

final class DisplaySegmentProviderProvider
    extends $NotifierProvider<DisplaySegmentProvider, DisplaySegment> {
  DisplaySegmentProviderProvider._({
    required DisplaySegmentProviderFamily super.from,
    required (Id<Trip>, Id<Segment>) super.argument,
  }) : super(
         retry: null,
         name: r'displaySegmentProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$displaySegmentProviderHash();

  @override
  String toString() {
    return r'displaySegmentProviderProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DisplaySegmentProvider create() => DisplaySegmentProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DisplaySegment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DisplaySegment>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DisplaySegmentProviderProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$displaySegmentProviderHash() =>
    r'5ec9d9d7809ec233c28813c732122d358644ead5';

final class DisplaySegmentProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          DisplaySegmentProvider,
          DisplaySegment,
          DisplaySegment,
          DisplaySegment,
          (Id<Trip>, Id<Segment>)
        > {
  DisplaySegmentProviderFamily._()
    : super(
        retry: null,
        name: r'displaySegmentProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DisplaySegmentProviderProvider call(Id<Trip> tripId, Id<Segment> segmentId) =>
      DisplaySegmentProviderProvider._(
        argument: (tripId, segmentId),
        from: this,
      );

  @override
  String toString() => r'displaySegmentProviderProvider';
}

abstract class _$DisplaySegmentProvider extends $Notifier<DisplaySegment> {
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
