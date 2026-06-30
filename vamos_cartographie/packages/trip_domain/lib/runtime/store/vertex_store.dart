import 'package:domain_core/observable_collection_store.dart';
import 'package:domain_core/collection_store.dart';
import 'package:trip_domain/domain/domain.dart';

class VertexStore {
  final store = ObservableCollectionStore<Vertex>();

  VertexStore();

  void insert(Vertex vertex) => store.insert(vertex);
  void update(Vertex vertex) => store.update(vertex);
  void remove(VertexId id) => store.remove(id);
  void clear() => store.clear();
}

extension VertexGetters on VertexStore {
  Vertex? getFrom(VertexId vertexId) => store.get(vertexId);
}
