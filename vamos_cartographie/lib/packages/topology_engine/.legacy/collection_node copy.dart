import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/graph/observable_factory.dart';
import 'observable_node.dart';
import 'graph_node.dart';

class CollectionNode<T extends HasId<T>> {
  final Map<Id<T>, GraphNode<T>> _elements = {};

  late ObservableNode _observer;
  late ObservableFactory _observableFactory;

  CollectionNode({required ObservableFactory observableFactory}) {
    _observableFactory = observableFactory;
    // On install un observeur pour watch la collection
    _observer = observableFactory();
  }

  int _tempId = -1;
  int nextTempId() => _tempId--;

  void notify() => _observer.notify();

  void clear() {
    _elements.clear();
    notify();
  }

  GraphNode<T>? getNode(Id<T> id) => _elements[id];

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
      Map.unmodifiable(_elements.map((k, v) => MapEntry(k, v.value)));

  void remove(Id<T> id) {
    getRequired(id);
    _elements.remove(id);
    notify();
  }

  GraphNode<T> popNode(Id<T> id) {
    final res = _elements.remove(id);
    if (res == null) {
      throw Exception("Id $id of $T not found in store");
    }
    return res;
  }

  GraphNode<T> add(T value, ObservableNode observer) {
    GraphNode<T> newNode = GraphNode<T>(value, observer);
    _elements[value.id] = newNode;
    notify();
    return newNode;
  }

  Id<T> create(T Function(Id<T> tempId) builder) {
    final id = Id<T>(nextTempId());
    add(builder(id), _observableFactory());
    return id;
  }

  T update(Id<T> id, T Function(T current) mutate) {
    final node = getNodeRequired(id);
    final old = node.value;
    node.update(mutate);
    return old;
  }

  // ─────────────────────────────────────────────
  // DELETE (soft)
  // ─────────────────────────────────────────────

  void softDelete(Id<T> id) => getNodeRequired(id).markDeleted(true);

  void commitCreate({required Id<T> tempId, required T serverEntity}) {
    final GraphNode<T> node = popNode(tempId);
    // On transmet l'observer de node au nouveau pour garder les mêmes listeners
    final newNode = add(serverEntity, node.observer);
    newNode.observer.notify();
  }

  void commitUpdate(Id<T> id, T serverValue) {
    final node = getNodeRequired(id);
    node.set(serverValue);
    node.markDeleted(false);
  }

  void commitDelete(Id<T> id) => remove(id);
  void rollbackCreate(Id<T> id) => remove(id);
  void rollbackDelete(Id<T> id) => getNodeRequired(id).markDeleted(false);
  void rollbackUpdate(Id<T> id, T previous) =>
      getNodeRequired(id).set(previous);
}
