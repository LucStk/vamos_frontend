// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobility_badge_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

@ProviderFor(mobilityBadgeItem)
final mobilityBadgeItemProvider = MobilityBadgeItemFamily._();

/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

final class MobilityBadgeItemProvider
    extends
        $FunctionalProvider<
          MobilityBadgeItem?,
          MobilityBadgeItem?,
          MobilityBadgeItem?
        >
    with $Provider<MobilityBadgeItem?> {
  /// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.
  MobilityBadgeItemProvider._({
    required MobilityBadgeItemFamily super.from,
    required (TripId, MobilitySpanId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'mobilityBadgeItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mobilityBadgeItemHash();

  @override
  String toString() {
    return r'mobilityBadgeItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<MobilityBadgeItem?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MobilityBadgeItem? create(Ref ref) {
    final argument = this.argument as (TripId, MobilitySpanId, MapCameraReader);
    return mobilityBadgeItem(ref, argument.$1, argument.$2, argument.$3);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MobilityBadgeItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MobilityBadgeItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MobilityBadgeItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mobilityBadgeItemHash() => r'68a2db3a6067d238271b6100323551e9f6ad511a';

/// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

final class MobilityBadgeItemFamily extends $Family
    with
        $FunctionalFamilyOverride<
          MobilityBadgeItem?,
          (TripId, MobilitySpanId, MapCameraReader)
        > {
  MobilityBadgeItemFamily._()
    : super(
        retry: null,
        name: r'mobilityBadgeItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Un item par section : ne se reconstruit que si SA plage ou la géométrie change.

  MobilityBadgeItemProvider call(
    TripId tripId,
    MobilitySpanId id,
    MapCameraReader cameraReader,
  ) => MobilityBadgeItemProvider._(
    argument: (tripId, id, cameraReader),
    from: this,
  );

  @override
  String toString() => r'mobilityBadgeItemProvider';
}
