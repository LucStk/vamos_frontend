import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/graph/graph.dart";
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
import 'package:vamos_cartographie/features/topology/data/providers/segments_providers.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

part 'segment_orchestrator.g.dart';

@riverpod
class SegmentOrchestrator extends _$SegmentOrchestrator {
  GraphStore get graph => ref.read(graphStoreProvider);
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);
  SegmentRepository get segmentRepo => ref.read(segmentRepositoryProvider);

  @override
  void build(int tripId) {}

  // ---------------------------------------------------------------------------
  // CREATE WAYPOINT (WITH OPTIONAL VERTEX)
  // ---------------------------------------------------------------------------

  Future<void> createSegment(SegmentDraft draft) async {
    late int tempId;
    await executor.run(
      onApply: () {
        tempId = graph.create<Segment>((int tmpId) => draft.toSegment(tempId));
      },
      remote: () => segmentRepo.createSegment(tripId, draft),
      onSuccess: (Segment serverSegment) => graph.commitCreate<Segment>(
        tempId: tempId,
        serverEntity: serverSegment,
      ),
      onError: () {
        graph.rollbackCreate<Segment>(tempId);
      },
    );
  }

  Future<void> deleteSegment(int id) async {
    await executor.run(
      onApply: () => graph.delete<Segment>(id),
      remote: () => segmentRepo.deleteSegment(id),
      onSuccess: (_) => graph.commitDelete(id),
      onError: () => graph.rollbackDelete(id),
    );
  }

  Future<void> updateSegment(int segmentId, SegmentDraft draft) async {
    late Segment oldValue;
    await executor.run(
      onApply: () {
        oldValue = graph.update<Segment>(segmentId, (Segment v) {
          return draft.toSegment(segmentId);
        });
      },
      remote: () => segmentRepo.updateSegment(segmentId, draft),
      onSuccess: (serveurValue) => graph.commitUpdate(segmentId, serveurValue),
      onError: () => graph.update<Segment>(segmentId, (v) {
        return oldValue;
      }),
    );
  }
}
