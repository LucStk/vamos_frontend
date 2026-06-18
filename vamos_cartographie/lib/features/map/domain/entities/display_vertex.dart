import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/features.dart';

part "display_vertex.freezed.dart";

@freezed
abstract class DisplayVertex with _$DisplayVertex {
  const factory DisplayVertex({
    required Vertex vertex,
    required LatLng
    currentLatLng, // La position actuellement affichée sur la carte
    @Default(false) bool isDragging,
  }) = _DisplayVertex;
}
