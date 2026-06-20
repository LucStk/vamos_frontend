import 'package:domain_core/id.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/application/graph_executor.dart';
import 'package:topology_engine/application/ports/vertex_port.dart';
import 'package:topology_engine/topology_engine.dart';

class CreateVertex {
  final VertexPort port;
  final GraphStore store;
  final OptimisticExecutor executor;

  CreateVertex(this.port, this.store, this.executor);

  Future<void> call(GraphId graphId, LatLng latLng) async {
    late Id<Vertex> tempId;

    await executor.run(
      onApply: () {
        tempId = store.vertexStore.create(
          (VertexId tmpId) => Vertex(id: tmpId, latLng: latLng),
        );
      },
      remote: () => port.createVertex(graphId, latLng),
      onSuccess: (Vertex serverVertex) => store.vertexStore.commitCreate(
        tempId: tempId,
        serverEntity: serverVertex,
      ),
      onError: () {
        store.vertexStore.rollbackCreate(tempId);
      },
    );
  }
}
