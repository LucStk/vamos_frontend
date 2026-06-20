import 'package:domain_core/id.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_application/runtime/store/segments_overlay_store.dart';
import 'package:topology_engine/application/graph_executor.dart';
import 'package:topology_engine/application/ports/vertex_port.dart';
import 'package:topology_engine/topology_engine.dart';

class MoveVertex {
  final VertexPort port;
  final SegmentsOverlayStore overlayStore;
  final GraphStore store;
  final OptimisticExecutor executor;

  MoveVertex(this.port, this.store, this.overlayStore, this.executor);

  Future<void> call(Id<Vertex> vertexId, LatLng latLng) async {
    late Vertex oldValue;
    await executor.run(
      onApply: () {
        oldValue = store.update<Vertex>(vertexId, (Vertex v) {
          return v.copyWith(latLng: latLng);
        }); // On bouge le vertex
        // On bouge les segments possiblement associés.
        
      },
      remote: () => port.moveVertex(vertexId, latLng),
      onSuccess: (serveurValue) => store.commitUpdate(vertexId, serveurValue),
      onError: () => store.update<Vertex>(vertexId, (v) {
        return oldValue;
      }),
    );
  }
}
