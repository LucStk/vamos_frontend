import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/id.dart';
import 'package:trip_application/topology/domain/value_objects/mobility_types.dart';

part 'segment_patch.freezed.dart';

typedef SegmentPatchId = Id<SegmentPatch>;

@freezed
abstract class SegmentPatch with _$SegmentPatch implements HasId {
  // <- On retire le implements d'ici

  // On utilise @Implements sur le constructeur cible
  const factory SegmentPatch.internal({
    required SegmentPatchId id,
    required Geometry geometryOverride,
    @Default(MobilityType.bike) MobilityType mobilityType,
    @Default(false) bool recomputing,
    Object? error,
  }) = _SegmentPatch;

  const SegmentPatch._(); // Requis pour pouvoir utiliser @Implements

  factory SegmentPatch({
    SegmentPatchId? id,
    required Geometry geometryOverride,
    bool recomputing = false,
    Object? error,
    MobilityType mobilityType = MobilityType.bike,
  }) {
    final finalId = id ?? Id.generate();

    return SegmentPatch.internal(
      id: finalId,
      geometryOverride: geometryOverride,
      recomputing: recomputing,
      error: error,
      mobilityType: mobilityType,
    );
  }
}
