import 'package:domain_core/id.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/topology_engine.dart';
import 'package:topology_engine/application/graph_executor.dart';
import 'package:topology_engine/application/ports/segment_port.dart';

class CreateSegment {
  final SegmentPort port;
  final GraphStore store;
  final OptimisticExecutor executor;

  CreateSegment(this.port, this.store, this.executor);

  Future<void> call(
    GraphId graphId,
    SegmentDraft draft,
    List<LatLng> optimistGeometry,
  ) async {
    late Id<Segment> tempId;

    await executor.run(
      onApply: () {
        tempId = store.create((id) => draft.toSegment(id, optimistGeometry));
      },
      remote: () => port.createSegment(graphId, draft),
      onSuccess: (segment) {
        store.commitCreate(tempId: tempId, serverEntity: segment);
      },
      onError: () {
        store.rollbackCreate(tempId);
      },
    );
  }
}
