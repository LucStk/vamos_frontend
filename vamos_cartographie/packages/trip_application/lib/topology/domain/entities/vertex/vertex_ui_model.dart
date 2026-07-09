import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import '/topology/domain/types/types.dart';
import '/topology/domain/entities/entities.dart';
part "vertex_ui_model.freezed.dart";

@freezed
abstract class VertexUiModel with _$VertexUiModel {
  const factory VertexUiModel({
    required VertexRef ref,
    required LatLng position,
  }) = _VertexUiModel;
}

extension ToVertexUi on Vertex {
  VertexUiModel toUiModel() =>
      VertexUiModel(ref: ConfirmedVertexRef(id), position: latLng);
}

extension ToVertexPatchUi on VertexPatch {
  VertexUiModel toUiModel() =>
      VertexUiModel(ref: PendingVertexRef(id), position: positionOverride);
}
