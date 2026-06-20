import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'vertex_patch.freezed.dart';

@freezed
abstract class VertexPatch with _$VertexPatch {
  const factory VertexPatch({
    required LatLng positionOverride,
    @Default(false) bool recomputing,
    Object? error,
  }) = _VertexPatch;
}
