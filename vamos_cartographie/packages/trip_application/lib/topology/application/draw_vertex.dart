import 'package:domain_core/optimitic_executor.dart';
import 'package:trip_application/topology/runtime/runtime.dart';

class DrawVertex {
  final GraphStore store;
  final OptimisticExecutor executor;

  DrawVertex(this.store, this.executor);

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
