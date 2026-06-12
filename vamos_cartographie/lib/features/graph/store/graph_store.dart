import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/features/graph/core/core.dart';

class GraphStore {
  final Map<Type, Map<int, Node<dynamic>>> _entities = {};
  final Map<Type, CollectionNode> _collections = {};

  int _tempId = -1;
  int nextTempId() => _tempId--;

  // ─────────────────────────────────────────────
  // COLLECTION ACCESS
  // ─────────────────────────────────────────────

  CollectionNode collection<T>() {
    return _collections.putIfAbsent(T, () => CollectionNode());
  }

  // ─────────────────────────────────────────────
  // ENTITY ACCESS
  // ─────────────────────────────────────────────

  Map<int, Node<T>> map<T>() {
    final existing = _entities[T];
    if (existing != null) {
      return existing.cast<int, Node<T>>();
    }

    final created = <int, Node<T>>{};
    _entities[T] = created;
    return created;
  }

  Node<T>? node<T>(int id) {
    return map<T>()[id];
  }

  T? get<T>(int id) => node<T>(id)?.value;

  // ─────────────────────────────────────────────
  // CREATE
  // ─────────────────────────────────────────────

  int create<T>(T Function(int tempId) builder) {
    final id = nextTempId();

    map<T>()[id] = Node<T>(builder(id));

    // structure change only
    collection<T>().notify();

    return id;
  }

  // ─────────────────────────────────────────────
  // UPDATE (local optimistic)
  // ─────────────────────────────────────────────

  T update<T>(int id, T Function(T current) mutate) {
    final node = map<T>()[id];
    if (node == null) {
      throw Exception("Entity $T:$id not found");
    }

    final old = node.value;
    node.value = mutate(node.value);

    node.revision++;
    node.notify(); // 👈 ONLY NODE

    return old;
  }

  // ─────────────────────────────────────────────
  // DELETE (soft delete local)
  // ─────────────────────────────────────────────

  void delete<T>(int id) {
    final node = map<T>()[id];
    if (node == null) return;

    node.deleted = true;

    node.notify(); // fine-grain
  }

  // ─────────────────────────────────────────────
  // COMMIT UPDATE (server sync)
  // ─────────────────────────────────────────────

  void commitUpdate<T>(int id, T serverValue) {
    final node = map<T>()[id];
    if (node == null) return;

    node.value = serverValue;
    node.revision++;
    node.deleted = false;

    node.notify();
  }

  // ─────────────────────────────────────────────
  // COMMIT CREATE
  // ─────────────────────────────────────────────

  void commitCreate<T extends HasId>({
    required int tempId,
    required T serverEntity,
  }) {
    final map = this.map<T>();

    final node = map.remove(tempId);
    if (node == null) return;

    node.value = serverEntity;
    node.deleted = false;
    node.revision++;

    map[serverEntity.id] = node;

    // structure changed
    collection<T>().notify();
  }

  // ─────────────────────────────────────────────
  // COMMIT DELETE
  // ─────────────────────────────────────────────

  void commitDelete<T>(int id) {
    map<T>().remove(id);

    // structure changed
    collection<T>().notify();
  }

  // ─────────────────────────────────────────────
  // ROLLBACKS
  // ─────────────────────────────────────────────

  void rollbackCreate<T>(int id) {
    map<T>().remove(id);
    collection<T>().notify();
  }

  void rollbackDelete<T>(int id) {
    final node = map<T>()[id];
    if (node == null) return;

    node.deleted = false;
    node.notify();
  }

  void rollbackUpdate<T>(int id, T previous) {
    final node = map<T>()[id];
    if (node == null) return;

    node.value = previous;
    node.notify();
  }
}
