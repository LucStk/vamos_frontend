import 'package:topology_engine/domain/entities/segment.dart';
import 'package:topology_engine/domain/entities/vertex.dart';
import 'package:topology_engine/graph/graph_store.dart';

class GraphMutator {
  final GraphStore store;

  GraphMutator(this.store);

  void commitCreate(T serverEntity) {
    GraphNode<T> newNode = GraphNode<T>(value, observer);
    _elements[value.id] = newNode;
    notify();
    newNode.observer.notify();
  }

  void commitUpdate(Id<T> id, T serverValue) {
    final node = getNodeRequired(id);
    node.set(serverValue);
    node.markDeleted(false);
  }

  void commitDelete(Id<T> id) => remove(id);
}
