import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/domain.dart';
part "vertex_ui_model.freezed.dart";

@freezed
abstract class VertexUiModel with _$VertexUiModel {
  const factory VertexUiModel({
    required LatLng position,
    required bool isOptimistic,
    PoiCategory? poiCategory,
  }) = _VertexUiModel;
}
