import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/domain.dart';
part "vertex_ui.freezed.dart";

@freezed
abstract class VertexUi with _$VertexUi {
  const factory VertexUi({
    required VertexRef id,
    required LatLng position,
    required bool isOptimistic,
    required PoiCategory? poiCategory,
  }) = _VertexUi;
}

extension ToVertexUi on Vertex {
  VertexUi toUiModel(PoiCategory? poiCategory) => VertexUi(
    id: ConfirmedVertexRef(id),
    position: latLng,
    isOptimistic: false,
    poiCategory: poiCategory,
  );
}

extension ToVertexPatchUi on VertexPatch {
  VertexUi toUiModel(PoiCategory? poiCategory) => VertexUi(
    id: PendingVertexRef(id),
    position: positionOverride,
    isOptimistic: true,
    poiCategory: poiCategory,
  );
}
