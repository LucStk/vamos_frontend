import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/domain/entities/entities.dart';

typedef ResMoveVertex = (Vertex, List<Segment>);

abstract class VertexMovePort {
  Future<Either<Failure, ResMoveVertex>> moveVertex(
    Id<Vertex> id,
    LatLng latLng,
  );
}
