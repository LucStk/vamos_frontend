import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_application/topology_application.dart';
import 'package:trip_domain/domain/domain.dart';
part "vertex_ui_model.freezed.dart";

@freezed
abstract class VertexUiModel with _$VertexUiModel {
  const factory VertexUiModel({
    required Id id,
    required LatLng position,
    required bool isOptimistic,
    required PoiCategory? poiCategory,
  }) = _VertexUiModel;
}

extension VertexUi on Vertex {
  VertexUiModel toUiModel(PoiCategory? poiCategory) => VertexUiModel(
    id: id,
    position: latLng,
    isOptimistic: false,
    poiCategory: poiCategory,
  );
}

extension VertexPatchUi on VertexPatch {
  VertexUiModel toUiModel(PoiCategory? poiCategory) => VertexUiModel(
    id: id,
    position: positionOverride,
    isOptimistic: true,
    poiCategory: poiCategory,
  );
}
