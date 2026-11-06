// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_layer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Couche « segments » d'un trajet : agrège les items de toutes ses sections.

@ProviderFor(allSegmentItem)
final allSegmentItemProvider = AllSegmentItemFamily._();

/// Couche « segments » d'un trajet : agrège les items de toutes ses sections.

final class AllSegmentItemProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  /// Couche « segments » d'un trajet : agrège les items de toutes ses sections.
  AllSegmentItemProvider._({
    required AllSegmentItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'allSegmentItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allSegmentItemHash();

  @override
  String toString() {
    return r'allSegmentItemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return allSegmentItem(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SceneItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SceneItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllSegmentItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allSegmentItemHash() => r'da98e940d373e8d2f237d3141e9e31f0cef60e96';

/// Couche « segments » d'un trajet : agrège les items de toutes ses sections.

final class AllSegmentItemFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, (TripId, MapCameraReader)> {
  AllSegmentItemFamily._()
    : super(
        retry: null,
        name: r'allSegmentItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Couche « segments » d'un trajet : agrège les items de toutes ses sections.

  AllSegmentItemProvider call(TripId tripId, MapCameraReader camera) =>
      AllSegmentItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'allSegmentItemProvider';
}
