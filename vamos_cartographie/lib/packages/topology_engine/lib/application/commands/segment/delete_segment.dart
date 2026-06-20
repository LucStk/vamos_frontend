import 'package:domain_core/id.dart';
import 'package:topology_engine/topology_engine.dart';

import 'package:topology_engine/application/graph_executor.dart';
import 'package:topology_engine/application/ports/segment_port.dart';

class DeleteSegment {
  final SegmentPort port;
  final GraphStore store;
  final OptimisticExecutor executor;

  DeleteSegment(this.port, this.store, this.executor);

  Future<void> call(Id<Segment> id) async {
    await executor.run(
      onApply: () => store.delete<Segment>(id),
      remote: () => port.deleteSegment(id),
      onSuccess: (_) => store.commitDelete(id),
      onError: () => store.rollbackDelete(id),
    );
  }
}
