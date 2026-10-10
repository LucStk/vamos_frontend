import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/domain_core.dart';
import '/topology/domain/value_objects/mobility_types.dart';

part 'segment_model.freezed.dart';

sealed class SegmentFields implements HasId {
  MobilityType get mobilityType;
  @override
  Id<SegmentFields> get id;
  Geometry get geometry;
}

typedef SegmentId = Id<SegmentFields>;

@freezed
abstract class SegmentRemoteModel
    with _$SegmentRemoteModel
    implements SegmentFields {
  const factory SegmentRemoteModel({
    required SegmentId id,
    required Geometry geometry,
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _SegmentRemoteModel;

  const SegmentRemoteModel._();

  factory SegmentRemoteModel.fromFields(SegmentFields fields) {
    return SegmentRemoteModel(
      id: fields.id,
      geometry: fields.geometry,
      mobilityType: fields.mobilityType,
    );
  }
}

@freezed
abstract class SegmentPatchModel
    with _$SegmentPatchModel
    implements Patch<SegmentRemoteModel>, SegmentFields {
  @Implements<Patch<SegmentRemoteModel>>()
  const factory SegmentPatchModel.internal({
    required SegmentId id,
    required Geometry geometry,
    @Default(MobilityType.bike) MobilityType mobilityType,
    @Default(false) bool recomputing,
    Object? error,
  }) = _SegmentPatchModel;

  const SegmentPatchModel._();

  factory SegmentPatchModel.fromFields(
    SegmentFields fields, {
    bool recomputing = false,
    Object? error,
  }) {
    return SegmentPatchModel.internal(
      id: fields.id,
      geometry: fields.geometry,
      mobilityType: fields.mobilityType,
      recomputing: recomputing,
      error: error,
    );
  }

  factory SegmentPatchModel({
    SegmentId? id,
    required Geometry geometry,
    bool recomputing = false,
    Object? error,
    MobilityType mobilityType = MobilityType.bike,
  }) {
    return SegmentPatchModel.internal(
      id: id ?? Id.generate(),
      geometry: geometry,
      recomputing: recomputing,
      error: error,
      mobilityType: mobilityType,
    );
  }
}
