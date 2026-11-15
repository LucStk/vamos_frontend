import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/waypoint/domain/stay_model.dart';
import 'package:trip_application/src/waypoint/domain/waypoint_kind.dart';

part 'waypoint_model.freezed.dart';

sealed class WaypointFields implements HasId {
  @override
  WaypointId get id;
  String get title;
  WaypointKind? get kind;
  String get description;
  LatLng get position;
  double get anchorPosition;

  /// Halte de nuit sur ce waypoint, ou null.
  StayInfo? get stay;
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
    required double anchorPosition,
    @Default('') String title,
    WaypointKind? kind,
    @Default('') String description,
    StayInfo? stay,
  }) = _WaypointRemoteModel;

  factory WaypointRemoteModel.fromFields(WaypointFields fields) {
    return WaypointRemoteModel(
      id: fields.id,
      title: fields.title,
      kind: fields.kind,
      description: fields.description,
      position: fields.position,
      anchorPosition: fields.anchorPosition,
      stay: fields.stay,
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
    WaypointKind? kind,
    required double anchorPosition,
    required String description,
    StayInfo? stay,
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
      kind: fields.kind,
      description: fields.description,
      anchorPosition: fields.anchorPosition,
      stay: fields.stay,
      recomputing: recomputing,
      error: error,
    );
  }

  factory WaypointPatchModel({
    WaypointId? id,
    required LatLng position,
    required double anchorPosition,
    String? title,
    WaypointKind? kind,
    String? description,
    StayInfo? stay,
    bool recomputing = false,
    Object? error,
  }) {
    return WaypointPatchModel.internal(
      id: id ?? WaypointId.generate(),
      position: position,
      anchorPosition: anchorPosition,
      kind: kind,
      title: title ?? '',
      description: description ?? '',
      stay: stay,
      recomputing: recomputing,
      error: error,
    );
  }
}
