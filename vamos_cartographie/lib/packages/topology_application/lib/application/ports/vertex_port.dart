import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/domain/entities/entities.dart';
import 'package:topology_engine/domain/types/graph_id.dart';

typedef ResMoveVertex = (Vertex, List<Segment>);

abstract class VertexPort {
  Future<Either<Failure, ResMoveVertex>> moveVertex(
    Id<Vertex> id,
    LatLng latLng,
  );

  Future<Either<Failure, Vertex>> createVertex(GraphId graphId, LatLng latLng);

  Future<Either<Failure, Unit>> deleteVertex(Id<Vertex> id);
}
