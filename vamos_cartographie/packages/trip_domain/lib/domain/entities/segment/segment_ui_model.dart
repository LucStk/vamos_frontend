import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/helpers/gis.dart';
part "segment_ui_model.freezed.dart";

@freezed
abstract class SegmentUiModel with _$SegmentUiModel {
  const factory SegmentUiModel({
    required SegmentRef id,
    required Geometry geometry,
    required MobilityType mobilityType,
  }) = _SegmentUiModel;
  const SegmentUiModel._();
  Geometry get mobilityMarkerPosition => [boundsCenter(geometry)];
}

extension ToSegmentUiModel on Segment {
  SegmentUiModel toUiModel() => SegmentUiModel(
    id: ConfirmedSegmentRef(id),
    geometry: geometry,
    mobilityType: mobilityType,
  );
}

extension SegmentPatchUi on SegmentPatch {
  SegmentUiModel toUiModel() => SegmentUiModel(
    id: PendingSegmentRef(id),
    geometry: geometryOverride,
    mobilityType: mobilityType,
  );
}
