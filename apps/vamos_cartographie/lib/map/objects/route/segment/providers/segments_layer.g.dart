// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segments_layer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Couche « segments » d'un trajet : uniquement les traits.
///
/// Les segments doivent rester consécutifs dans la scène : c'est ce qui
/// permet à `elevateActive` de remonter le segment actif au-dessus de ses
/// voisins.

@ProviderFor(allSegmentItem)
final allSegmentItemProvider = AllSegmentItemFamily._();

/// Couche « segments » d'un trajet : uniquement les traits.
///
/// Les segments doivent rester consécutifs dans la scène : c'est ce qui
/// permet à `elevateActive` de remonter le segment actif au-dessus de ses
/// voisins.

final class AllSegmentItemProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  /// Couche « segments » d'un trajet : uniquement les traits.
  ///
  /// Les segments doivent rester consécutifs dans la scène : c'est ce qui
  /// permet à `elevateActive` de remonter le segment actif au-dessus de ses
  /// voisins.
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

String _$allSegmentItemHash() => r'872e749faa9183e2d09890adc3be27b9556c7817';

/// Couche « segments » d'un trajet : uniquement les traits.
///
/// Les segments doivent rester consécutifs dans la scène : c'est ce qui
/// permet à `elevateActive` de remonter le segment actif au-dessus de ses
/// voisins.

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

  /// Couche « segments » d'un trajet : uniquement les traits.
  ///
  /// Les segments doivent rester consécutifs dans la scène : c'est ce qui
  /// permet à `elevateActive` de remonter le segment actif au-dessus de ses
  /// voisins.

  AllSegmentItemProvider call(TripId tripId, MapCameraReader camera) =>
      AllSegmentItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'allSegmentItemProvider';
}

/// Couche « badges » : séparée des segments, et placée au-dessus d'eux dans
/// les scènes, sinon un segment recouvre le badge de la section suivante.

@ProviderFor(allMobilityBadgeItem)
final allMobilityBadgeItemProvider = AllMobilityBadgeItemFamily._();

/// Couche « badges » : séparée des segments, et placée au-dessus d'eux dans
/// les scènes, sinon un segment recouvre le badge de la section suivante.

final class AllMobilityBadgeItemProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  /// Couche « badges » : séparée des segments, et placée au-dessus d'eux dans
  /// les scènes, sinon un segment recouvre le badge de la section suivante.
  AllMobilityBadgeItemProvider._({
    required AllMobilityBadgeItemFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'allMobilityBadgeItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allMobilityBadgeItemHash();

  @override
  String toString() {
    return r'allMobilityBadgeItemProvider'
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
    return allMobilityBadgeItem(ref, argument.$1, argument.$2);
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
    return other is AllMobilityBadgeItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allMobilityBadgeItemHash() =>
    r'67af817d35347f94addc5da82ff2d76606db2a5a';

/// Couche « badges » : séparée des segments, et placée au-dessus d'eux dans
/// les scènes, sinon un segment recouvre le badge de la section suivante.

final class AllMobilityBadgeItemFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, (TripId, MapCameraReader)> {
  AllMobilityBadgeItemFamily._()
    : super(
        retry: null,
        name: r'allMobilityBadgeItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Couche « badges » : séparée des segments, et placée au-dessus d'eux dans
  /// les scènes, sinon un segment recouvre le badge de la section suivante.

  AllMobilityBadgeItemProvider call(TripId tripId, MapCameraReader camera) =>
      AllMobilityBadgeItemProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'allMobilityBadgeItemProvider';
}
