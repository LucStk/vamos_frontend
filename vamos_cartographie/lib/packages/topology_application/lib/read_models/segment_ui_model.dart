import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:topology_engine/domain/types/geometry.dart';
part "segment_view_model.freeze.dart";

@freezed
abstract class SegmentUiModel with _$SegmentUiModel {
  const factory SegmentUiModel({
    required Geometry geometry,
    required Geometry mobilityMarker,
    required bool isOptimistic,
  }) = _SegmentUiModel;
}
