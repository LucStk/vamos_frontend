import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/domain/entities/entities.dart';
import 'package:topology_engine/domain/value_objects/graph_id.dart';

abstract class VertexPort {
  Future<Either<Failure, Vertex>> createVertex(GraphId graphId, LatLng latLng);

  Future<Either<Failure, Unit>> deleteVertex(Id<Vertex> id);

  Future<Either<Failure, Vertex>> moveVertex(Id<Vertex> id, LatLng latLng);
}
