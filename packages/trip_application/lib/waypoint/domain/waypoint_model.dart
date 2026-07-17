import 'package:domain_core/domain/patchable.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_application/trip_application.dart';
part 'waypoint_model.freezed.dart';

abstract interface class WaypointFields implements HasId {
  @override
  WaypointId get id;
  VertexId get vertexId;
  String get title;
  PoiCategory get poiCategory;
  String get description;
}

typedef WaypointId = Id<WaypointFields>;

@freezed
abstract class WaypointRemoteModel
    with _$WaypointRemoteModel
    implements WaypointFields {
  const WaypointRemoteModel._();
  const factory WaypointRemoteModel({
    required WaypointId id,
    required VertexId vertexId,
    @Default('') String title,
    @Default(PoiCategory.waypoint) PoiCategory poiCategory,
    @Default('') String description,
  }) = _WaypointRemoteModel;

  factory WaypointRemoteModel.fromFields(WaypointFields fields) {
    return WaypointRemoteModel(
      id: fields.id,
      vertexId: fields.vertexId,
      title: fields.title,
      poiCategory: fields.poiCategory,
      description: fields.description,
    );
  }
}

@freezed
abstract class WaypointPatchModel
    with _$WaypointPatchModel
    implements Patch<WaypointRemoteModel>, WaypointFields {
  @Implements<Patch<WaypointRemoteModel>>()
  const factory WaypointPatchModel.internal({
    required WaypointId id,
    required VertexId vertexId,
    required String title,
    required PoiCategory poiCategory,
    required String description,
    required bool recomputing,
    Object? error,
  }) = _WaypointPatchModel;

  const WaypointPatchModel._();

  factory WaypointPatchModel.fromFields(
    WaypointFields fields, {
    bool recomputing = false,
    Object? error,
  }) {
    return WaypointPatchModel.internal(
      id: fields.id,
      vertexId: fields.vertexId,
      title: fields.title,
      poiCategory: fields.poiCategory,
      description: fields.description,
      recomputing: recomputing,
      error: error,
    );
  }
  factory WaypointPatchModel({
    WaypointId? id,
    required VertexId vertexId,
    String? title,
    PoiCategory? poiCategory,
    String? description,
    bool recomputing = false,
    Object? error,
  }) {
    return WaypointPatchModel.internal(
      id: id ?? WaypointId.generate(),
      vertexId: vertexId,
      poiCategory: poiCategory ?? PoiCategory.waypoint,
      title: title ?? "",
      description: description ?? "",
      recomputing: recomputing,
      error: error,
    );
  }
}
