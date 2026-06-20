import 'package:domain_core/id.dart';
import 'package:topology_engine/application/graph_executor.dart';
import 'package:topology_engine/application/ports/vertex_port.dart';
import 'package:topology_engine/topology_engine.dart';

class DeleteVertex {
  final VertexPort port;
  final GraphStore store;
  final OptimisticExecutor executor;

  DeleteVertex(this.port, this.store, this.executor);

  Future<void> call(Id<Vertex> id) async {
    await executor.run(
      onApply: () => store.vertexStore.softDelete(id),
      remote: () => port.deleteVertex(id),
      onSuccess: (_) => store.vertexStore.commitDelete(id),
      onError: () => store.vertexStore.rollbackDelete(id),
    );
  }
}
