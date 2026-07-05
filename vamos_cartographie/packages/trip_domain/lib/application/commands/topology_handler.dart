import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/trip_domain.dart';

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
    final Segment? oldValue = graphStore.segmentStore.get(segment.id);
    if (oldValue == null) {
      return Left(
        NotFoundFailure(resourceType: "Segment", resourceId: "${segment.id}"),
      );
    }
    return await executor.run(
      onApply: () => graphStore.updateSegment(segment),
      remote: () => segmentRepo.updateSegment(segment),
      onSuccess: (serveurValue) => graphStore.updateSegment(serveurValue),
      onError: (Failure failure) {
        graphStore.updateSegment(oldValue);
      },
    );
  }

  Future<Either<Failure, Vertex>> createSimpleVertex(LatLng latLng) async {
    return await executor.run(
      onApply: () {},
      remote: () => vertexRepo.createVertex(tripId, latLng),
      onSuccess: (Vertex serveurValue) => graphStore.insertVertex(serveurValue),
      onError: (Failure failure) {},
    );
  }

  Future<Either<Failure, Vertex>> moveVertex(
    VertexRef ref,
    LatLng latLng,
  ) async {
    return await executor.run(
      onApply: () {},
      remote: () => vertexRepo.moveVertex(ref.id as VertexId, latLng),
      onSuccess: (Vertex serveurValue) => graphStore.updateVertex(serveurValue),
      onError: (Failure failure) {},
    );
  }
}
