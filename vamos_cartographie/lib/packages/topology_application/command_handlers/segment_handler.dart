import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:topology_engine/application/pipeline/graph_executor.dart';
import 'package:topology_engine/runtime/store/graph_store.dart';
import 'package:topology_engine/data/providers/segments_providers.dart';
import 'package:topology_engine/data/repositories/segment_repository.dart';
import 'package:topology_engine/domain/domain.dart';
import 'package:topology_engine/queries/selectors/graph_selectors.dart';
import 'package:topology_engine/infrastructure/providers/topology_providers.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

part 'segment_handler.g.dart';

@riverpod
class SegmentHandler extends _$SegmentHandler {
  GraphStore get graph => ref.read(tripGraphProvider(tripId)).requireValue;
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);
  SegmentRepository get segmentRepo => ref.read(segmentRepositoryProvider);

  @override
  void build(Id<Trip> tripId) {}

  // ---------------------------------------------------------------------------
  // CREATE WAYPOINT (WITH OPTIONAL VERTEX)
  // ---------------------------------------------------------------------------

  Future<void> createSegment(
    SegmentDraft draft,
    List<LatLng> optimistGeometry,
  ) async {
    late Id<Segment> tempId;
    await executor.run(
      onApply: () {
        tempId = graph.create<Segment>(
          (Id<Segment> tempId) => draft.toSegment(tempId, optimistGeometry),
        );
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

  Future<void> deleteSegment(Id<Segment> id) async {
    await executor.run(
      onApply: () => graph.delete<Segment>(id),
      remote: () => segmentRepo.deleteSegment(id),
      onSuccess: (_) => graph.commitDelete(id),
      onError: () => graph.rollbackDelete(id),
    );
  }

  Future<void> updateSegment({
    required Id<Segment> segmentId,
    required SegmentDraft draft,
    List<LatLng>? optimistGeometry,
  }) async {
    late Segment oldValue;
    late List<LatLng> geometry;
    if (optimistGeometry == null) {
      geometry = ref.read(nodeRequiredProvider(tripId, segmentId)).geometry;
    } else {
      geometry = optimistGeometry;
    }
    await executor.run(
      onApply: () {
        oldValue = graph.update<Segment>(segmentId, (Segment v) {
          return draft.toSegment(segmentId, geometry);
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
