import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/domain/domain.dart';
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
