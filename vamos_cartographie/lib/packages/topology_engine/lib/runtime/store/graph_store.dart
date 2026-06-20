import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/runtime/observables/observable_node.dart';
import 'nodes/graph_node.dart';
import 'nodes/collection_node.dart';

typedef ObservableFactory = ObservableNode Function();

class GraphStore {
  final Map<Type, Map<dynamic, GraphNode<dynamic>>> _entities = {};
  final Map<Type, CollectionNode<dynamic>> _collectionSignals = {};

  int _tempId = -1;
  int nextTempId() => _tempId--;

  final ObservableFactory _observableFactory;

  GraphStore(this._observableFactory);
  // ─────────────────────────────────────────────
  // COLLECTION SIGNAL
  // ─────────────────────────────────────────────

  CollectionNode<T> collectionSignal<T>() {
    final node = _collectionSignals.putIfAbsent(
      T,
      () => CollectionNode<T>(_observableFactory()),
    );

    return node as CollectionNode<T>;
  }

  void clear() {
    _entities.clear();

    for (final signal in _collectionSignals.values) {
      signal.notify();
    }
  }

  Map<Id<T>, GraphNode<T>> map<T>() {
    final raw = _entities[T];

    if (raw != null) {
      return raw.cast<Id<T>, GraphNode<T>>();
    }

    final created = <Id<T>, GraphNode<T>>{};
    _entities[T] = created;
    return created;
  }

  // Permet de charger les données sans passer par les notifiers
  void seed<T extends HasId<T>>(T entity, ObservableNode observer) {
    final store = map<T>();
    store[entity.id] = GraphNode<T>(entity, observer);

    collectionSignal<T>().notify();
  }
  // ─────────────────────────────────────────────
  // INTERNAL MAP
  // ─────────────────────────────────────────────

  GraphNode<T>? node<T>(Id<T> id) => map<T>()[id];
  GraphNode<T> requiredNode<T>(Id<T> id) {
    final node = map<T>()[id];
    if (node == null) {
      throw Exception('Node not found: $id');
    }
    return node;
  }

  T? get<T>(Id<T> id) => node<T>(id)?.value;
  T getRequired<T>(Id<T> id) {
    final res = get<T>(id);
    if (res == null) {
      throw Exception("Error topology_engine : id item not found in store");
    }
    return res;
  }

  Map<Id<T>, T> getAll<T>() {
    return Map.unmodifiable(map<T>().map((k, v) => MapEntry(k, v.value)));
  }

  // ─────────────────────────────────────────────
  // CREATE
  // ─────────────────────────────────────────────

  Id<T> create<T>(T Function(Id<T> tempId) builder) {
    final id = Id<T>(nextTempId());

    map<T>()[id] = GraphNode<T>(builder(id), _observableFactory());

    collectionSignal<T>().notify();
    return id;
  }

  // ─────────────────────────────────────────────
  // UPDATE (optimistic)
  // ─────────────────────────────────────────────

  T update<T>(Id<T> id, T Function(T current) mutate) {
    final node = map<T>()[id];

    if (node == null) {
      throw Exception("Entity $T:$id not found");
    }

    final old = node.value;
    node.update(mutate);

    return old;
  }

  // ─────────────────────────────────────────────
  // DELETE (soft)
  // ─────────────────────────────────────────────

  void delete<T>(Id<T> id) {
    final node = map<T>()[id];
    if (node == null) return;

    node.markDeleted(true);
  }

  // ─────────────────────────────────────────────
  // COMMIT CREATE
  // ─────────────────────────────────────────────

  void commitCreate<T extends HasId<T>>({
    required Id<T> tempId,
    required T serverEntity,
  }) {
    final m = map<T>();

    final node = m.remove(tempId);
    if (node == null) return;

    node.set(serverEntity);
    node.markDeleted(false);

    m[serverEntity.id] = node;

    collectionSignal<T>().notify();
  }

  // ─────────────────────────────────────────────
  // COMMIT UPDATE
  // ─────────────────────────────────────────────

  void commitUpdate<T>(Id<T> id, T serverValue) {
    final node = map<T>()[id];
    if (node == null) return;

    node.set(serverValue);
    node.markDeleted(false);
  }

  // ─────────────────────────────────────────────
  // COMMIT DELETE
  // ─────────────────────────────────────────────

  void commitDelete<T>(Id<T> id) {
    map<T>().remove(id);
    collectionSignal<T>().notify();
  }

  // ─────────────────────────────────────────────
  // ROLLBACKS
  // ─────────────────────────────────────────────

  void rollbackCreate<T>(Id<T> id) {
    map<T>().remove(id);
    collectionSignal<T>().notify();
  }

  void rollbackDelete<T>(Id<T> id) {
    final node = map<T>()[id];
    if (node == null) return;

    node.markDeleted(false);
  }

  void rollbackUpdate<T>(Id<T> id, T previous) {
    final node = map<T>()[id];
    if (node == null) return;

    node.set(previous);
  }
}
