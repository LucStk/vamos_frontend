import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'vertex.freezed.dart';

@freezed
abstract class Vertex with _$Vertex {
  const factory Vertex({required int id, required LatLng latLng}) = _Vertex;
}
