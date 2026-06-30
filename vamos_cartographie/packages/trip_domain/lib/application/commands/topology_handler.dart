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

  Future<void> updateSegment(Segment segment) async {
    final Segment? oldValue = graphStore.segmentStore.get(segment.id);
    if (oldValue == null) {
      throw Exception("Segment.id not in graphStore");
    }
    await executor.run(
      onApply: () => graphStore.updateSegment(segment),
      remote: () => segmentRepo.updateSegment(segment),
      onSuccess: (serveurValue) => graphStore.updateSegment(serveurValue),
      onError: (Failure failure) => graphStore.updateSegment(oldValue),
    );
  }

  Future<void> createSimpleVertex(LatLng latLng) async {
    throw Exception("Create Simple Vertex not implemented yet");
  }

  Future<void> moveVertex(Id id, LatLng latLng) async {
    throw Exception("Move vertex not implemented yet");
  }
}
