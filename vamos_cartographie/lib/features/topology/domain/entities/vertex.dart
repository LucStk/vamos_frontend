import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import "package:vamos_cartographie/core/type/has_id.dart";
part 'vertex.freezed.dart';

@freezed
abstract class Vertex with _$Vertex implements HasId {
  const factory Vertex({required int id, required LatLng latLng}) = _Vertex;
}
