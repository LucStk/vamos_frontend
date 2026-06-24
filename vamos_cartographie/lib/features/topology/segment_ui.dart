import 'package:domain_core/domain_core.dart';
import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topology_application/helpers/gis.dart';
import 'package:topology_application/topology_application.dart';
import 'package:trip_domain/domain/domain.dart';
import "mobility_types_ui.dart";
part "segment_ui.freezed.dart";

typedef SegmentUiId = Id<SegmentUi>;

@freezed
abstract class SegmentUi with _$SegmentUi {
  const factory SegmentUi({
    required SegmentUiId id,
    required Geometry geometry,
    required bool isOptimistic,
    required MobilityTypeUi mobilityType,
  }) = _SegmentUi;
  const SegmentUi._();
  Geometry get mobilityMarkerPosition => [boundsCenter(geometry)];
}

extension ToSegmentUi on Segment {
  SegmentUi toUiModel() => SegmentUi(
    id: id as SegmentUiId,
    geometry: geometry,
    isOptimistic: false,
    mobilityType: MobilityTypeUi.from(mobilityType),
  );
}

extension SegmentPatchUi on SegmentPatch {
  SegmentUi toUiModel() => SegmentUi(
    id: id as SegmentUiId,
    geometry: geometryOverride,
    isOptimistic: true,
    mobilityType: MobilityTypeUi.from(mobilityType),
  );
}
