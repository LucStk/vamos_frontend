import 'package:domain_core/id.dart';
import 'package:topology_engine/topology_engine.dart';

import 'package:topology_engine/application/graph_executor.dart';
import 'package:topology_engine/application/ports/segment_port.dart';

class UpdateSegment {
  final SegmentPort port;
  final GraphStore store;
  final OptimisticExecutor executor;

  UpdateSegment(this.port, this.store, this.executor);

  Future<void> call(Id<Segment> segmentId, SegmentDraft draft) async {
    late Segment oldValue;
    await executor.run(
      onApply: () {
        oldValue = store.segmentStore.update(segmentId, (Segment v) {
          return v.copyWithDraft(draft);
        });
      },
      remote: () => port.updateSegment(segmentId, draft),
      onSuccess: (serveurValue) =>
          store.segmentStore.commitUpdate(segmentId, serveurValue),
      onError: () => store.segmentStore.update(segmentId, (v) {
        return oldValue;
      }),
    );
  }
}
