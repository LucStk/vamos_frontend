import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import "package:domain_core/domain_core.dart";
import 'package:trip_application/trip_application.dart';
part 'vertex_model.freezed.dart';

sealed class VertexFields implements HasId {
  @override
  Id<VertexFields> get id;
  LatLng get latLng;
}

typedef VertexId = Id<VertexFields>;

@freezed
abstract class VertexRemoteModel
    with _$VertexRemoteModel
    implements VertexFields {
  const factory VertexRemoteModel({
    required VertexId id,
    required LatLng latLng,
  }) = _VertexRemoteModel;

  const VertexRemoteModel._();

  factory VertexRemoteModel.fromFields(VertexFields fields) {
    return VertexRemoteModel(id: fields.id, latLng: fields.latLng);
  }
}

@freezed
abstract class VertexPatchModel
    with _$VertexPatchModel
    implements Patch<VertexRemoteModel>, VertexFields {
  @Implements<Patch<VertexRemoteModel>>()
  const factory VertexPatchModel.internal({
    required VertexId id,
    required LatLng latLng,
    PoiCategory? type,
    required bool recomputing,
    Object? error,
  }) = _VertexPatchModel;

  const VertexPatchModel._();
  factory VertexPatchModel.fromFields(
    VertexFields fields, {
    bool recomputing = false,
    Object? error,
  }) {
    return VertexPatchModel.internal(
      id: fields.id,
      latLng: fields.latLng,
      recomputing: recomputing,
      error: error,
    );
  }
  factory VertexPatchModel({
    VertexId? id,
    required LatLng latLng,
    PoiCategory? type,
    bool recomputing = false,
    Object? error,
  }) {
    return VertexPatchModel.internal(
      id: id ?? VertexId.generate(),
      latLng: latLng,
      type: type,
      recomputing: recomputing,
      error: error,
    );
  }

  VertexRemoteModel toEntity() => VertexRemoteModel(id: id, latLng: latLng);
}
