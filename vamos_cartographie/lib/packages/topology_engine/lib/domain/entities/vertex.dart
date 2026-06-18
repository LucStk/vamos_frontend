import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import "package:vamos_cartographie/core/type/has_id.dart";
import 'package:vamos_cartographie/core/type/id.dart';
part 'vertex.freezed.dart';

@freezed
abstract class Vertex with _$Vertex implements HasId<Vertex> {
  const factory Vertex({required Id<Vertex> id, required LatLng latLng}) =
      _Vertex;
}
