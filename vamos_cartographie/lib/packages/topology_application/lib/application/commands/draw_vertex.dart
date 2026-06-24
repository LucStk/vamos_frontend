import 'package:domain_core/optimitic_executor.dart';
import 'package:topology_application/application/ports/vertex_port.dart';
import 'package:topology_application/patches/graph_patch_store.dart';
import 'package:trip_domain/runtime/store/graph_store.dart';

class DrawVertex {
  final VertexPort port;
  final GraphPatchStore patchStore;
  final GraphStore store;
  final OptimisticExecutor executor;

  DrawVertex(this.port, this.store, this.patchStore, this.executor);

  // Future<void> call(Id<Vertex> vertexId, LatLng latLng) async {
  //   late Vertex oldValue;
  //   await executor.run(
  //     onApply: () => _onApply(vertexId, latLng),
  //     remote: () => port.createVertex(latLng),
  //     onSuccess: (serveurValue) => store.commitUpdate(vertexId, serveurValue),
  //     onError: () => store.update<Vertex>(vertexId, (v) {
  //       return oldValue;
  //     }),
  //   );
  // }
}
