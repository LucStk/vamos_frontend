import 'package:domain_core/optimitic_executor.dart';
import 'package:trip_domain/trip_domain.dart';
import "package:domain_core/collection_store.dart";

class SegmentHandler {
  GraphStore graphStore;
  SegmentRepository repo;
  OptimisticExecutor executor;
  TripId tripId;

  SegmentHandler(this.tripId, this.graphStore, this.repo, this.executor);

  Future<void> updateSegment(Segment segment) async {
    final Segment? oldValue = graphStore.segmentStore.get(segment.id);
    if (oldValue == null) {
      throw Exception("Segment.id not in graphStore");
    }
    await executor.run(
      onApply: () => graphStore.updateSegment(segment),
      remote: () => repo.updateSegment(segment),
      onSuccess: (serveurValue) => graphStore.updateSegment(serveurValue),
      onError: () => graphStore.updateSegment(oldValue),
    );
  }
}
