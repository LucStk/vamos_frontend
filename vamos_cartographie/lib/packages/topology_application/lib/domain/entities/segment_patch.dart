import 'package:domain_core/geometry.dart';
import 'package:domain_core/has_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/id.dart';

part 'segment_patch.freezed.dart';

int _nextSegmentNegativeId = -1;

@freezed
abstract class SegmentPatch with _$SegmentPatch implements HasId {
  // <- On retire le implements d'ici

  // On utilise @Implements sur le constructeur cible
  const factory SegmentPatch.internal({
    required Id<SegmentPatch> id,
    required Geometry geometryOverride,
    @Default(false) bool recomputing,
    Object? error,
  }) = _SegmentPatch;

  const SegmentPatch._(); // Requis pour pouvoir utiliser @Implements

  factory SegmentPatch({
    Id<SegmentPatch>? id,
    required Geometry geometryOverride,
    bool recomputing = false,
    Object? error,
  }) {
    final finalId = id ?? Id(_nextSegmentNegativeId--);

    return SegmentPatch.internal(
      id: finalId,
      geometryOverride: geometryOverride,
      recomputing: recomputing,
      error: error,
    );
  }
}
