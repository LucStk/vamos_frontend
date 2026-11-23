// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_segment_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(daySegmentItem)
final daySegmentItemProvider = DaySegmentItemFamily._();

final class DaySegmentItemProvider
    extends
        $FunctionalProvider<DaySegmentItem?, DaySegmentItem?, DaySegmentItem?>
    with $Provider<DaySegmentItem?> {
  DaySegmentItemProvider._({
    required DaySegmentItemFamily super.from,
    required (TripId, WaypointId?, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'daySegmentItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$daySegmentItemHash();

  @override
  String toString() {
    return r'daySegmentItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<DaySegmentItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DaySegmentItem? create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId?, MapCameraReader);
    return daySegmentItem(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DaySegmentItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DaySegmentItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DaySegmentItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$daySegmentItemHash() => r'4f1a8e99ef54d2e3c623c3a877f9f8cf7cdf8183';

final class DaySegmentItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          DaySegmentItem?,
          (TripId, WaypointId?, MapCameraReader)
        > {
  DaySegmentItemFamily._()
    : super(
        retry: null,
        name: r'daySegmentItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  DaySegmentItemProvider call(
    TripId tripId,
    WaypointId? endsAt,
    MapCameraReader cameraReader,
  ) => DaySegmentItemProvider._(
    argument: (tripId, endsAt, cameraReader),
    from: this,
  );

  @override
  String toString() => r'daySegmentItemProvider';
}
