import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/core/core.dart';

class GraphStore {
  final Map<Type, Map<dynamic, GraphNode<dynamic>>> _entities = {};
  final Map<Type, ValueNotifier<int>> _collectionSignals = {};

  int _tempId = -1;
  int nextTempId() => _tempId--;

  // ─────────────────────────────────────────────
  // COLLECTION SIGNAL
  // ─────────────────────────────────────────────

  ValueListenable<int> collectionSignal<T>() {
    return _collectionSignals.putIfAbsent(T, () => ValueNotifier(0));
  }

  void clear() {
    _entities.clear();

    for (final signal in _collectionSignals.values) {
      signal.value++;
    }
  }

  void _notifyCollection<T>() {
    _collectionSignals[T]?.value++;
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

    _notifyCollection<T>();
  }
  // ─────────────────────────────────────────────
  // INTERNAL MAP
  // ─────────────────────────────────────────────

  GraphNode<T>? node<T>(Id<T> id) => map<T>()[id];

  T? get<T>(Id<T> id) => node<T>(id)?.value;

  Map<Id<T>, T> getAll<T>() {
    return map<T>().map((k, v) => MapEntry(k, v.value));
  }

  // ─────────────────────────────────────────────
  // CREATE
  // ─────────────────────────────────────────────

  Id<T> create<T>(T Function(Id<T> tempId) builder) {
    final id = Id<T>(nextTempId());

    map<T>()[id] = GraphNode<T>(builder(id));

    _notifyCollection<T>();
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

    _notifyCollection<T>();
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
    _notifyCollection<T>();
  }

  // ─────────────────────────────────────────────
  // ROLLBACKS
  // ─────────────────────────────────────────────

  void rollbackCreate<T>(Id<T> id) {
    map<T>().remove(id);
    _notifyCollection<T>();
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
