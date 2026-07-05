import 'package:domain_core/has_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/id.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/trip_domain.dart';

part 'vertex_patch.freezed.dart';

@freezed
abstract class VertexPatch with _$VertexPatch implements HasId {
  // <- On retire le implements d'ici

  // On utilise @Implements sur le constructeur cible
  const factory VertexPatch.internal({
    required Id<VertexPatch> id,
    required LatLng positionOverride,
    PoiCategory? type,
    required bool recomputing,
    Object? error,
  }) = _VertexPatch;

  const VertexPatch._(); // Requis pour pouvoir utiliser @Implements

  factory VertexPatch({
    Id<VertexPatch>? id,
    required LatLng positionOverride,
    PoiCategory? type,
    bool recomputing = false,
    Object? error,
  }) {
    final finalId = id ?? Id.generate();

    return VertexPatch.internal(
      id: finalId,
      positionOverride: positionOverride,
      type: type,
      recomputing: recomputing,
      error: error,
    );
  }
}
