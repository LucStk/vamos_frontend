import 'package:dartz/dartz.dart';
import 'package:domain_core/failure.dart';
import 'package:domain_core/id.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_domain/trip_domain.dart';
import "package:domain_core/collection_store.dart";

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

  Future<Failure?> updateSegment(Segment segment) async {
    final Segment? oldValue = graphStore.segmentStore.get(segment.id);
    if (oldValue == null) {
      return NotFoundFailure(
        resourceType: "Segment",
        resourceId: "${segment.id}",
      );
    }
    final res = await executor.run(
      onApply: () => graphStore.updateSegment(segment),
      remote: () => segmentRepo.updateSegment(segment),
      onSuccess: (serveurValue) => graphStore.updateSegment(serveurValue),
      onError: (Failure failure) {
        graphStore.updateSegment(oldValue);
      },
    );
    return res.fold((failure) => failure, (_) => null);
  }

  Future<Failure?> createSimpleVertex(LatLng latLng) async {
    final res = await vertexRepo.createVertex(tripId, latLng);
    res.fold(
      (Failure f) {
        return f;
      },
      (Vertex v) {
        graphStore.insertVertex(v);
      },
    );
  }

  Future<Failure?> moveVertex(Id id, LatLng latLng) async {
    return UnexpectedFailure();
  }
}
