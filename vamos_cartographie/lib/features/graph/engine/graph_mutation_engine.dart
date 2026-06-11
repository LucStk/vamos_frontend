import 'package:vamos_cartographie/features/graph/infrastructure/graph_store.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

class GraphMutationEngine {
  final GraphStore store;

  GraphMutationEngine(this.store);

  void deleteVertex(int id, int txId) {
    store.applyDeleteTx<Vertex>(id, txId);
  }

  int createVertex(int txId, LatLng latLng) {
    return store.applyCreate<Vertex>(
      txId: txId,
      create: (tempId) => Vertex(id: tempId, latLng: latLng),
    );
  }
}
