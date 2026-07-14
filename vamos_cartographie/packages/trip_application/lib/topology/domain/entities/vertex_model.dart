import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import "package:domain_core/domain_core.dart";
import 'package:trip_application/trip_application.dart';
part 'vertex_model.freezed.dart';

@freezed
abstract class Vertex with _$Vertex implements Patchable<Vertex> {
  const factory Vertex({required Id<Vertex> id, required LatLng latLng}) =
      _Vertex;

  const Vertex._();

  @override
  Patch<Vertex> createPatch() {
    return VertexPatch.internal(
      id: id, // Ou une logique de conversion d'ID
      positionOverride: latLng,
      recomputing: false,
    );
  }
}

typedef VertexId = Id<Vertex>;

@freezed
abstract class VertexPatch with _$VertexPatch implements Patch<Vertex> {
  @Implements<Patch<Vertex>>()
  const factory VertexPatch.internal({
    required Id<Vertex> id,
    required LatLng positionOverride,
    PoiCategory? type,
    required bool recomputing,
    Object? error,
  }) = _VertexPatch;

  const VertexPatch._();

  factory VertexPatch({
    Id<Vertex>? id,
    required LatLng positionOverride,
    PoiCategory? type,
    bool recomputing = false,
    Object? error,
  }) {
    return VertexPatch.internal(
      id: id ?? Id<Vertex>.generate(),
      positionOverride: positionOverride,
      type: type,
      recomputing: recomputing,
      error: error,
    );
  }

  @override
  Vertex toEntity() => Vertex(id: id, latLng: positionOverride);
}
