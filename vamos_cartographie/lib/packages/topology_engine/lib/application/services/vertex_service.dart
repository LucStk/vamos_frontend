import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_engine/application/pipeline/graph_executor.dart';
import 'package:topology_engine/application/ports/vertex_port.dart';
import 'package:topology_engine/domain/entities/entities.dart';
import 'package:topology_engine/domain/value_objects/graph_id.dart';
import 'package:topology_engine/runtime/runtime.dart';

class VertexService {
  final GraphStore graph;
  final OptimisticExecutor executor;
  final VertexPort vertexPort;

  VertexService({
    required this.graph,
    required this.executor,
    required this.vertexPort,
  });

  Future<void> createVertex(GraphId graphId, LatLng latLng) async {
    late Id<Vertex> tempId;

    await executor.run(
      onApply: () {
        tempId = graph.create<Vertex>(
          (Id<Vertex> tmpId) => Vertex(id: tmpId, latLng: latLng),
        );
      },
      remote: () => vertexPort.createVertex(graphId, latLng),
      onSuccess: (Vertex serverVertex) => graph.commitCreate<Vertex>(
        tempId: tempId,
        serverEntity: serverVertex,
      ),
      onError: () {
        graph.rollbackCreate<Vertex>(tempId);
      },
    );
  }

  Future<void> deleteVertex(Id<Vertex> id) async {
    await executor.run(
      onApply: () => graph.delete<Vertex>(id),
      remote: () => vertexPort.deleteVertex(id),
      onSuccess: (_) => graph.commitDelete(id),
      onError: () => graph.rollbackDelete(id),
    );
  }

  Future<void> moveVertex(Id<Vertex> vertexId, LatLng latLng) async {
    late Vertex oldValue;
    await executor.run(
      onApply: () {
        oldValue = graph.update<Vertex>(vertexId, (Vertex v) {
          return v.copyWith(latLng: latLng);
        });
      },
      remote: () => vertexPort.moveVertex(vertexId, latLng),
      onSuccess: (serveurValue) => graph.commitUpdate(vertexId, serveurValue),
      onError: () => graph.update<Vertex>(vertexId, (v) {
        return oldValue;
      }),
    );
  }
}
