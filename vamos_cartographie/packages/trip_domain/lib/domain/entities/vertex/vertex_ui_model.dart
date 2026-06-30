import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/domain.dart';
part "vertex_ui_model.freezed.dart";

@freezed
abstract class VertexUiModel with _$VertexUiModel {
  const factory VertexUiModel({
    required VertexRef ref,
    required LatLng position,
    required PoiCategory? poiCategory,
  }) = _VertexUiModel;
}

extension ToVertexUi on Vertex {
  VertexUiModel toUiModel(PoiCategory? poiCategory) => VertexUiModel(
    ref: ConfirmedVertexRef(id),
    position: latLng,
    poiCategory: poiCategory,
  );
}

extension ToVertexPatchUi on VertexPatch {
  VertexUiModel toUiModel(PoiCategory? poiCategory) => VertexUiModel(
    ref: PendingVertexRef(id),
    position: positionOverride,
    poiCategory: poiCategory,
  );
}
