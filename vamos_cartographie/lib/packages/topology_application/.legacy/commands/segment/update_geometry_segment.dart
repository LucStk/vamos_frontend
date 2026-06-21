import 'package:topology_application/application/ports/segment_geometry_port.dart';
import 'package:topology_application/helpers/gis.dart';
import 'package:topology_application/runtime/store/segments_overlay_store.dart';
import 'package:topology_engine/topology_engine.dart';
import 'package:topology_engine/application/graph_executor.dart';

class UpdateGeometrySegment {
  final SegmentGeometryPort port;
  final SegmentsOverlayStore overlayStore;
  final GraphStore store;
  final OptimisticExecutor executor;

  UpdateGeometrySegment(
    this.port,
    this.store,
    this.overlayStore,
    this.executor,
  );

  Future<void> call(
    GraphId graphId,
    SegmentId segmentId,
    Geometry geometry,
  ) async {
    await executor.run(
      onApply: () {
        overlayStore.set(segmentId, geometry);
      },
      remote: () => port.updateGeometry(segmentId, geometry),
      onSuccess: (Segment segment) {
        overlayStore.remove(segmentId);
        store.commitUpdate(segmentId, segment);
      },
      onError: () {
        overlayStore.remove(segmentId);
      },
    );
  }
}
