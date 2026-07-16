import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'graph_store.dart';

import 'package:trip_application/trip/domain/trip.dart';
import '/topology/domain/domain.dart';

mixin GraphEditor on OptimisticRunner<GraphStore> {
  // On définit les dépendances sous forme de getters abstraits
  TripId get tripId;
  SegmentRepository get segmentRepo;
  VertexRepository get vertexRepo;

  Future<Either<Failure, Segment>> updateSegment(Segment segment) async {
    return await run(
      onApply: (gs) => gs..patchSegment(segment),
      remote: (_) => segmentRepo.updateSegment(segment),
      onSuccess: (gs, serveurValue) => gs..setSegment(serveurValue),
      onError: (gs, Failure failure) => gs..rollbackSegment(segment.id),
    );
  }

  Future<Either<Failure, Vertex>> createSimpleVertex(LatLng latLng) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => vertexRepo.createVertex(tripId, latLng),
      onSuccess: (gs, Vertex serveurValue) => gs..insertVertex(serveurValue),
    );
  }

  Future<Either<Failure, Vertex>> moveVertex(
    VertexId vid,
    LatLng latLng,
  ) async {
    return await run(
      onApply: (gs) => gs..patchVertex(Vertex(id: vid, latLng: latLng)),
      remote: (_) => vertexRepo.moveVertex(VertexId(vid.value), latLng),
      onSuccess: (gs, Vertex serveurValue) => gs..setVertex(serveurValue),
      onError: (gs, Failure failure) => gs..rollbackVertex(vid),
    );
  }

  Future<Either<Failure, void>> removeVertex(VertexId vid) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => vertexRepo.deleteVertex(VertexId(vid.value)),
      onSuccess: (gs, _) => gs..removeVertex(Id<Vertex>(vid.value)),
    );
  }
}
