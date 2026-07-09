import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:latlong2/latlong.dart';
import '/topology/domain/domain.dart';
import '/trip/domain/domain.dart';

abstract class VertexRepository {
  Future<Either<Failure, List<Vertex>>> getVertices(TripId tripId);
  Future<Either<Failure, Vertex>> createVertex(TripId tripId, LatLng latLng);
  Future<Either<Failure, Vertex>> moveVertex(VertexId vertexId, LatLng latLng);
  Future<Either<Failure, void>> deleteVertex(VertexId vertexId);
}
