import 'package:domain_core/domain/patchable.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/waypoint/domain/poi_category_types.dart';
part 'waypoint_model.freezed.dart';

sealed class WaypointFields implements HasId {
  @override
  WaypointId get id;
  String get title;
  PoiCategory get poiCategory;
  String get description;
  LatLng get position;
}

typedef WaypointId = Id<WaypointFields>;

@freezed
abstract class WaypointRemoteModel
    with _$WaypointRemoteModel
    implements WaypointFields {
  const WaypointRemoteModel._();
  const factory WaypointRemoteModel({
    required WaypointId id,
    required LatLng position,
    @Default('') String title,
    @Default(PoiCategory.waypoint) PoiCategory poiCategory,
    @Default('') String description,
  }) = _WaypointRemoteModel;

  factory WaypointRemoteModel.fromFields(WaypointFields fields) {
    return WaypointRemoteModel(
      id: fields.id,
      title: fields.title,
      poiCategory: fields.poiCategory,
      description: fields.description,
      position: fields.position,
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
    required LatLng position,
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
      position: fields.position,
      title: fields.title,
      poiCategory: fields.poiCategory,
      description: fields.description,
      recomputing: recomputing,
      error: error,
    );
  }
  factory WaypointPatchModel({
    WaypointId? id,
    required LatLng position,
    String? title,
    PoiCategory? poiCategory,
    String? description,
    bool recomputing = false,
    Object? error,
  }) {
    return WaypointPatchModel.internal(
      id: id ?? WaypointId.generate(),
      position: position,
      poiCategory: poiCategory ?? PoiCategory.waypoint,
      title: title ?? "",
      description: description ?? "",
      recomputing: recomputing,
      error: error,
    );
  }
}
