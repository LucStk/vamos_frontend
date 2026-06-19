import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/application/pipeline/graph_executor.dart';
import 'package:topology_engine/application/ports/segment_port.dart';
import 'package:topology_engine/domain/entities/entities.dart';
import 'package:topology_engine/domain/value_objects/graph_id.dart';
import 'package:topology_engine/runtime/runtime.dart';

class SegmentService {
  final GraphStore graph;
  final OptimisticExecutor executor;
  final SegmentPort segmentPort;

  SegmentService({
    required this.graph,
    required this.executor,
    required this.segmentPort,
  });

  Future<void> createSegment(
    GraphId graphId,
    SegmentDraft draft,
    List<LatLng> geometry,
  ) async {
    late Id<Segment> tempId;

    await executor.run(
      onApply: () {
        tempId = graph.create((id) => draft.toSegment(id, geometry));
      },
      remote: () => segmentPort.createSegment(graphId, draft),
      onSuccess: (segment) {
        graph.commitCreate(tempId: tempId, serverEntity: segment);
      },
      onError: () {
        graph.rollbackCreate(tempId);
      },
    );
  }

  Future<void> deleteSegment(Id<Segment> id) async {
    await executor.run(
      onApply: () => graph.delete<Segment>(id),
      remote: () => segmentPort.deleteSegment(id),
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
      geometry = graph.requiredNode<Segment>(segmentId).value.geometry;
    } else {
      geometry = optimistGeometry;
    }
    await executor.run(
      onApply: () {
        oldValue = graph.update<Segment>(segmentId, (Segment v) {
          return draft.toSegment(segmentId, geometry);
        });
      },
      remote: () => segmentPort.updateSegment(segmentId, draft),
      onSuccess: (serveurValue) => graph.commitUpdate(segmentId, serveurValue),
      onError: () => graph.update<Segment>(segmentId, (v) {
        return oldValue;
      }),
    );
  }
}
