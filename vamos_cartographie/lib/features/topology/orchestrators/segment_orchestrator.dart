import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/domain/optimistic_spec.dart';
import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/topology/topology.dart';

part 'segment_orchestrator.g.dart';

@riverpod
class WaypointTopologyOrchestrator extends _$WaypointTopologyOrchestrator {
  GraphStore get graph => ref.read(graphStoreProvider);
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);
  SegmentRepository get segmentRepo => ref.read(segmentRepositoryProvider);

  @override
  void build(int tripId) {}

  // ---------------------------------------------------------------------------
  // CREATE WAYPOINT (WITH OPTIONAL VERTEX)
  // ---------------------------------------------------------------------------

  Future<void> createSegment(SegmentDraft draft) async {
    final tmpId = graph.nextTempId();
    final tmpSegment = draft.toSegment(tmpId);

    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.upsert<Segment>(tmpSegment),
        rollback: () => graph.remove<Segment>(tmpId),
        reconcile: (Segment v) {
          graph.remove<Segment>(tmpId);
          graph.upsert<Segment>(v);
        },
      ),
      remote: () => segmentRepo.createSegment(tmpId, draft),
    );
  }

  Future<void> deleteSegment(int id) async {
    final old = graph.getOrThrow<Segment>(id);
    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.remove<Segment>(id),
        rollback: () => graph.upsert<Segment>(old),
        reconcile: (_) {},
      ),

      remote: () => segmentRepo.deleteSegment(id),
    );
  }

  Future<void> updateSegment(int segmentId, SegmentDraft draft) async {
    final old = graph.getOrThrow<Segment>(segmentId);
    await executor.run(
      spec: OptimisticSpec(
        apply: () => graph.update<Segment>(draft.toSegment(segmentId)),
        rollback: () => graph.update(old),
        reconcile: (Segment segment) => graph.upsert<Segment>(segment),
        revision: 0,
      ),
      remote: () => segmentRepo.updateSegment(segmentId, draft),
    );
  }
}
