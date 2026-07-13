import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:latlong2/latlong.dart';

import 'package:trip_application/trip/domain/trip.dart';
import '/topology/domain/domain.dart';
import '/topology/runtime/runtime.dart';

class TopologyHandler {
  GraphStore graphStore;
  SegmentRepository segmentRepo;
  VertexRepository vertexRepo;
  OptimisticExecutor executor;
  TripId tripId;

  TopologyHandler(
    this.tripId,
    this.graphStore,
    this.segmentRepo,
    this.vertexRepo,
    this.executor,
  );

  Future<Either<Failure, Segment>> updateSegment(Segment segment) async {
    final oldValue = graphStore.segmentStore.store[segment.id];
    if (oldValue == null) {
      return Left(
        NotFoundFailure(resourceType: "Segment", resourceId: "${segment.id}"),
      );
    }
    return await executor.run(
      onApply: () => graphStore.upsertSegment(segment),
      remote: () => segmentRepo.updateSegment(segment),
      onSuccess: (serveurValue) => graphStore.commitSegment(serveurValue),
      onError: (Failure failure) => graphStore.rollbackSegment(segment.id),
    );
  }

  Future<Either<Failure, Vertex>> createSimpleVertex(LatLng latLng) async {
    return await executor.run(
      onApply: () {},
      remote: () => vertexRepo.createVertex(tripId, latLng),
      onSuccess: (Vertex serveurValue) => graphStore.upsertVertex(serveurValue),
      onError: (Failure failure) {},
    );
  }

  Future<Either<Failure, Vertex>> moveVertex(
    VertexId vid,
    LatLng latLng,
  ) async {
    return await executor.run(
      onApply: () => graphStore.upsertVertex(Vertex(id: vid, latLng: latLng)),
      remote: () => vertexRepo.moveVertex(VertexId(vid.value), latLng),
      onSuccess: (Vertex serveurValue) => graphStore.commitVertex(serveurValue),
      onError: (Failure failure) => graphStore.rollbackVertex(vid),
    );
  }

  Future<Either<Failure, void>> removeVertex(VertexId vid) async {
    return await executor.run(
      onApply: () {},
      remote: () => vertexRepo.deleteVertex(VertexId(vid.value)),
      onSuccess: (_) {
        graphStore.removeVertex(Id<Vertex>(vid.value));
      },
      onError: (Failure failure) {},
    );
  }
}
