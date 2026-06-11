import 'package:vamos_cartographie/core/type/has_id.dart';
import "package:vamos_cartographie/features/graph/core/core.dart";

typedef EntityMap<T> = Map<int, Node<T>>;

class GraphStore {
  final Map<Type, Map<int, Node<dynamic>>> _entities = {};

  int _tempId = -1;
  int nextTempId() => _tempId--;

  int _txCounter = 0;
  int nextTxId() => ++_txCounter;

  // =========================
  // INTERNAL MAP
  // =========================
  Map<int, Node<T>> _map<T>() {
    final map = _entities[T];
    if (map == null) {
      final newMap = <int, Node<T>>{};
      _entities[T] = newMap;
      return newMap;
    }
    return map.cast<int, Node<T>>();
  }

  // =========================
  // TX LIFECYCLE
  // =========================
  TxId beginTx() => nextTxId();

  // =========================
  // UPDATE (OPTIMISTIC)
  // =========================
  void applyTx<T>({
    required TxId txId,
    required int id,
    required T Function(T current) mutate,
  }) {
    final node = _map<T>()[id];
    if (node == null || node.value == null) return;

    final before = node.value as T;
    final after = mutate(before);

    node.txStack.add(Tx(id: txId, before: before, after: after));

    node.value = after;
  }

  // =========================
  // CREATE (OPTIMISTIC)
  // =========================
  int applyCreateTx<T>({
    required TxId txId,
    required T Function(int tempId) create,
  }) {
    final tempId = nextTempId();

    final node = Node<T>(create(tempId));

    node.txStack.add(
      Tx(id: txId, before: node.value as T, after: node.value as T),
    );

    _map<T>()[tempId] = node;

    return tempId;
  }

  // =========================
  // DELETE (OPTIMISTIC)
  // =========================
  void applyDeleteTx<T>({required TxId txId, required int id}) {
    final node = _map<T>()[id];
    if (node == null) return;

    node.txStack.add(
      Tx(id: txId, before: node.value as T, after: node.value as T),
    );

    node.deleted = true;
  }

  // =========================
  // ROLLBACK TX
  // =========================
  void rollbackTx(TxId txId) {
    for (final nodeMap in _entities.values) {
      for (final node in nodeMap.values) {
        final index = node.txStack.indexWhere((t) => t.id == txId);
        if (index == -1) continue;

        final tx = node.txStack.removeAt(index);

        node.value = tx.before;
        node.deleted = false;
      }
    }
  }

  // =========================
  // COMMIT TX
  // =========================
  void commitTx(TxId txId) {
    for (final nodeMap in _entities.values) {
      for (final node in nodeMap.values) {
        final hasTx = node.txStack.any((t) => t.id == txId);
        if (!hasTx) continue;

        node.txStack.removeWhere((t) => t.id == txId);

        node.revision++;
        node.txStack.clear();

        node.value = null;
        node.deleted = true;
      }
    }
  }

  // =========================
  // COMMIT CREATE (SERVER SYNC)
  // =========================
  void commitCreateTx<T>({
    required TxId txId,
    required int tempId,
    required T serverEntity,
  }) {
    final map = _map<T>();
    final node = map[tempId];

    if (node == null) return;

    map.remove(tempId);

    final realNode = Node<T>(serverEntity)..revision = node.revision + 1;

    map[(serverEntity as HasId).id] = realNode;

    node.txStack.clear();
  }

  // =========================
  // ROLLBACK CREATE
  // =========================
  void rollbackCreateTx<T>(int tempId) {
    _map<T>().remove(tempId);
  }
}
