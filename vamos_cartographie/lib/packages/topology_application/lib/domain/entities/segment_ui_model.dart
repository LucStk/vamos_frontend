import 'package:domain_core/domain_core.dart';
import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topology_application/helpers/gis.dart';
import 'package:topology_application/topology_application.dart';
import 'package:trip_domain/domain/entities/entities.dart';
part "segment_ui_model.freezed.dart";

@freezed
abstract class SegmentUiModel with _$SegmentUiModel {
  const factory SegmentUiModel({
    required Id id,
    required Geometry geometry,
    required bool isOptimistic,
  }) = _SegmentUiModel;
  const SegmentUiModel._();
  Geometry get mobilityMarkerPosition => [boundsCenter(geometry)];
}

extension SegmentUi on Segment {
  SegmentUiModel toUiModel() =>
      SegmentUiModel(id: id, geometry: geometry, isOptimistic: false);
}

extension SegmentPatchUi on SegmentPatch {
  SegmentUiModel toUiModel() =>
      SegmentUiModel(id: id, geometry: geometryOverride, isOptimistic: true);
}
