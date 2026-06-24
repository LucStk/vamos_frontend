import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_application/topology_application.dart';
import 'package:trip_domain/domain/domain.dart';
part "vertex_ui.freezed.dart";

typedef VertexUiId = Id<VertexUi>;

@freezed
abstract class VertexUi with _$VertexUi {
  const factory VertexUi({
    required VertexUiId id,
    required LatLng position,
    required bool isOptimistic,
    required PoiCategory? poiCategory,
  }) = _VertexUi;
}

extension ToVertexUi on Vertex {
  VertexUi toUiModel(PoiCategory? poiCategory) => VertexUi(
    id: id as VertexUiId,
    position: latLng,
    isOptimistic: false,
    poiCategory: poiCategory,
  );
}

extension ToVertexPatchUi on VertexPatch {
  VertexUi toUiModel(PoiCategory? poiCategory) => VertexUi(
    id: id as VertexUiId,
    position: positionOverride,
    isOptimistic: true,
    poiCategory: poiCategory,
  );
}
