import 'package:domain_core/has_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/id.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/value_objects/poi_category_types.dart';

part 'vertex_patch.freezed.dart';

typedef VertexPatchId = Id<VertexPatch>;
int _nextVertexNegativeId = -1;

@freezed
abstract class VertexPatch with _$VertexPatch implements HasId {
  // <- On retire le implements d'ici

  // On utilise @Implements sur le constructeur cible
  const factory VertexPatch.internal({
    required VertexId id,
    required LatLng positionOverride,
    PoiCategory? type,
    required bool recomputing,
    Object? error,
  }) = _VertexPatch;

  const VertexPatch._(); // Requis pour pouvoir utiliser @Implements

  factory VertexPatch({
    VertexId? id,
    required LatLng positionOverride,
    PoiCategory? type,
    bool recomputing = false,
    Object? error,
  }) {
    final finalId = id ?? Id(_nextVertexNegativeId--);

    return VertexPatch.internal(
      id: finalId,
      positionOverride: positionOverride,
      type: type,
      recomputing: recomputing,
      error: error,
    );
  }
}
