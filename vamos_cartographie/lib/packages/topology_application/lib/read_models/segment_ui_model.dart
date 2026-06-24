import 'package:domain_core/geometry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "segment_ui_model.freezed.dart";

@freezed
abstract class SegmentUiModel with _$SegmentUiModel {
  const factory SegmentUiModel({
    required Geometry geometry,
    required Geometry mobilityMarker,
    required bool isOptimistic,
  }) = _SegmentUiModel;
}
