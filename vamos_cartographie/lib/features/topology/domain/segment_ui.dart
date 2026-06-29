import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/helpers/gis.dart';
import 'package:vamos_cartographie/features/topology/presentation/adapters/mobility_type_display.dart';
part "segment_ui.freezed.dart";

@freezed
abstract class SegmentUi with _$SegmentUi {
  const factory SegmentUi({
    required SegmentRef id,
    required Geometry geometry,
    required bool isOptimistic,
    required MobilityTypeDisplay mobilityType,
  }) = _SegmentUi;
  const SegmentUi._();
  Geometry get mobilityMarkerPosition => [boundsCenter(geometry)];
}

extension ToSegmentUi on Segment {
  SegmentUi toUiModel() => SegmentUi(
    id: ConfirmedSegmentRef(id),
    geometry: geometry,
    isOptimistic: false,
    mobilityType: MobilityTypeDisplay.from(mobilityType),
  );
}

extension SegmentPatchUi on SegmentPatch {
  SegmentUi toUiModel() => SegmentUi(
    id: PendingSegmentRef(id),
    geometry: geometryOverride,
    isOptimistic: true,
    mobilityType: MobilityTypeDisplay.from(mobilityType),
  );
}
