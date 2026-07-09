import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import "package:domain_core/domain_core.dart";
part 'vertex_model.freezed.dart';

@freezed
abstract class Vertex with _$Vertex implements HasId {
  const factory Vertex({required Id<Vertex> id, required LatLng latLng}) =
      _Vertex;
}

typedef VertexId = Id<Vertex>;
