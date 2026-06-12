import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/features/graph/core/graph_node.dart';

class GraphStore {
  final Map<Type, Map<int, GraphNode<dynamic>>> _entities = {};
  final Map<Type, ValueNotifier<int>> _collectionSignals = {};

  int _tempId = -1;
  int nextTempId() => _tempId--;

  // ─────────────────────────────────────────────
  // COLLECTION SIGNAL
  // ─────────────────────────────────────────────

  ValueListenable<int> collectionSignal<T>() {
    return _collectionSignals.putIfAbsent(T, () => ValueNotifier(0));
  }

  void _notifyCollection<T>() {
    _collectionSignals[T]?.value++;
  }

  // ─────────────────────────────────────────────
  // INTERNAL MAP
  // ─────────────────────────────────────────────

  Map<int, GraphNode<T>> map<T>() {
    final existing = _entities[T];

    if (existing != null) {
      return existing.cast<int, GraphNode<T>>();
    }

    final created = <int, GraphNode<T>>{};
    _entities[T] = created;
    return created;
  }

  GraphNode<T>? node<T>(int id) {
    return map<T>()[id] as GraphNode<T>?;
  }

  T? get<T>(int id) => node<T>(id)?.value;

  Map<int, T> getAll<T>() {
    return map<T>().map((k, v) => MapEntry(k, v.value));
  }

  // ─────────────────────────────────────────────
  // CREATE
  // ─────────────────────────────────────────────

  int create<T>(T Function(int tempId) builder) {
    final id = nextTempId();

    map<T>()[id] = GraphNode<T>.create(builder(id));

    _notifyCollection<T>();

    return id;
  }

  // ─────────────────────────────────────────────
  // UPDATE (optimistic local)
  // ─────────────────────────────────────────────

  T update<T>(int id, T Function(T current) mutate) {
    final node = map<T>()[id];

    if (node == null) {
      throw Exception("Entity $T:$id not found");
    }

    final old = node.value;

    node.set(mutate(node.value)); // <- centralisé dans GraphNode

    return old;
  }

  // ─────────────────────────────────────────────
  // DELETE (soft delete)
  // ─────────────────────────────────────────────

  void delete<T>(int id) {
    final node = map<T>()[id];
    if (node == null) return;

    node.setDeleted(true);
  }

  // ─────────────────────────────────────────────
  // COMMIT UPDATE
  // ─────────────────────────────────────────────

  void commitUpdate<T>(int id, T serverValue) {
    final node = map<T>()[id];
    if (node == null) return;

    node
      ..set(serverValue)
      ..setDeleted(false)
      ..bumpRevision();
  }

  // ─────────────────────────────────────────────
  // COMMIT CREATE
  // ─────────────────────────────────────────────

  void commitCreate<T extends HasId>({
    required int tempId,
    required T serverEntity,
  }) {
    final m = map<T>();

    final node = m.remove(tempId);
    if (node == null) return;

    node
      ..set(serverEntity)
      ..setDeleted(false)
      ..bumpRevision();

    m[serverEntity.id] = node;

    _notifyCollection<T>();
  }

  // ─────────────────────────────────────────────
  // COMMIT DELETE
  // ─────────────────────────────────────────────

  void commitDelete<T>(int id) {
    map<T>().remove(id);
    _notifyCollection<T>();
  }

  // ─────────────────────────────────────────────
  // ROLLBACKS
  // ─────────────────────────────────────────────

  void rollbackCreate<T>(int id) {
    map<T>().remove(id);
    _notifyCollection<T>();
  }

  void rollbackDelete<T>(int id) {
    final node = map<T>()[id];
    if (node == null) return;

    node
      ..setDeleted(false)
      ..notify();
  }

  void rollbackUpdate<T>(int id, T previous) {
    final node = map<T>()[id];
    if (node == null) return;

    node
      ..set(previous)
      ..notify();
  }
}
