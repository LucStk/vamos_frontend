import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/domain/types/geometry.dart';
part "vertex_ui_model.freeze.dart";

@freezed
abstract class VertexUiModel with _$VertexUiModel {
  const factory VertexUiModel({
    required LatLng position,
    required bool isOptimistic,
  }) = _VertexUiModel;
}
