import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_application/topology/services/gis.dart';
import '/topology/domain/value_objects/mobility_types.dart';
import '/topology/domain/types/types.dart';
import '/topology/domain/entities/entities.dart';
part "segment_ui_model.freezed.dart";

@freezed
abstract class SegmentUiModel with _$SegmentUiModel {
  const factory SegmentUiModel({
    required SegmentRef ref,
    required Geometry geometry,
    required MobilityType mobilityType,
  }) = _SegmentUiModel;
  const SegmentUiModel._();
  Geometry get mobilityMarkerPosition => [boundsCenter(geometry)];
}

extension ToSegmentUiModel on Segment {
  SegmentUiModel toUiModel() => SegmentUiModel(
    ref: ConfirmedSegmentRef(id),
    geometry: geometry,
    mobilityType: mobilityType,
  );
}

extension SegmentPatchUi on SegmentPatch {
  SegmentUiModel toUiModel() => SegmentUiModel(
    ref: PendingSegmentRef(id),
    geometry: geometryOverride,
    mobilityType: mobilityType,
  );
}
