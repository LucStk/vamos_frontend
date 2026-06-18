import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/application/notifiers/collection_change_notifier.dart';
import 'package:vamos_cartographie/features/graph/application/notifiers/graph_node_change_notifier.dart';

class GraphStore {
  final Map<Type, Map<dynamic, GraphNode<dynamic>>> _entities = {};
  final Map<Type, CollectionSignal<dynamic>> _collectionSignals = {};

  int _tempId = -1;
  int nextTempId() => _tempId--;

  // ─────────────────────────────────────────────
  // COLLECTION SIGNAL
  // ─────────────────────────────────────────────

  CollectionSignal collectionSignal<T>() {
    return _collectionSignals.putIfAbsent(T, () => CollectionSignal<T>());
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
  void seed<T extends HasId<T>>(T entity) {
    final store = map<T>();
    store[entity.id] = GraphNode<T>(entity);

    collectionSignal<T>().notify();
  }
  // ─────────────────────────────────────────────
  // INTERNAL MAP
  // ─────────────────────────────────────────────

  GraphNode<T>? node<T>(Id<T> id) => map<T>()[id];

  T? get<T>(Id<T> id) => node<T>(id)?.value;

  Map<Id<T>, T> getAll<T>() {
    return Map.unmodifiable(map<T>().map((k, v) => MapEntry(k, v.value)));
  }

  // ─────────────────────────────────────────────
  // CREATE
  // ─────────────────────────────────────────────

  Id<T> create<T>(T Function(Id<T> tempId) builder) {
    final id = Id<T>(nextTempId());

    map<T>()[id] = GraphNode<T>(builder(id));

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
