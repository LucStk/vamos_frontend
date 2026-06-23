import 'package:domain_core/domain_core.dart';
import 'package:domain_core/observable_node.dart';
import 'graph_node.dart';

class CollectionNode<T extends HasId<T>> {
  final Map<Id<T>, GraphNode<T>> elements = {};

  late ObservableNode observableNode;

  CollectionNode({required ObservableNode observableNode}) {
    observableNode = observableNode;
  }
  void notify() => observableNode.notify();

  void clear() {
    elements.clear();
    notify();
  }

  GraphNode<T>? getNode(Id<T> id) => elements[id];

  GraphNode<T> getNodeRequired(Id<T> id) {
    final res = getNode(id);
    if (res == null) {
      throw Exception("Id $id of $T not found in store");
    }
    return res;
  }

  T? get(Id<T> id) => getNode(id)?.value;

  T getRequired(Id<T> id) => getNodeRequired(id).value;

  Map<Id<T>, T> getAll() =>
      Map.unmodifiable(elements.map((k, v) => MapEntry(k, v.value)));

  void add(T value, ObservableNode observer) {
    GraphNode<T> newNode = GraphNode<T>(value, observer);
    elements[value.id] = newNode;
    notify();
    observer.notify();
  }

  void remove(Id<T> id) {
    getRequired(id);
    elements.remove(id);
    notify();
  }
}
