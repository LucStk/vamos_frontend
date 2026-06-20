import 'package:domain_core/id.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/topology_engine.dart';

import 'package:topology_engine/application/graph_executor.dart';
import 'package:topology_engine/application/ports/segment_port.dart';

class UpdateSegment {
  final SegmentPort port;
  final GraphStore store;
  final OptimisticExecutor executor;

  UpdateSegment(this.port, this.store, this.executor);

  Future<void> call(
    Id<Segment> segmentId,
    SegmentDraft draft,
    List<LatLng>? optimistGeometry,
  ) async {
    late Segment oldValue;
    late List<LatLng> geometry;
    if (optimistGeometry == null) {
      geometry = store.requiredNode<Segment>(segmentId).value.geometry;
    } else {
      geometry = optimistGeometry;
    }
    await executor.run(
      onApply: () {
        oldValue = store.update<Segment>(segmentId, (Segment v) {
          return draft.toSegment(segmentId, geometry);
        });
      },
      remote: () => port.updateSegment(segmentId, draft),
      onSuccess: (serveurValue) => store.commitUpdate(segmentId, serveurValue),
      onError: () => store.update<Segment>(segmentId, (v) {
        return oldValue;
      }),
    );
  }
}
