import 'package:flutter/rendering.dart';
import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/features/graph/domain/entity_state.dart';

typedef TxId = int;
typedef EntityMap<T> = Map<int, _Node<T>>;

class _Tx<T> {
  final int id;
  final T before;
  T after;

  bool committed = false;

  _Tx({required this.id, required this.before, required this.after});
}

class _Node<T> {
  T value;

  int revision = 0;

  final List<_Tx<T>> _txStack = [];

  _Node(this.value);
}

class GraphStore {
  final Map<Type, Map<int, _Node<dynamic>>> _entities = {};

  int _txCounter = 0;

  int nextTxId() => ++_txCounter;

  Map<int, _Node<T>> _map<T>() {
    final map = _entities[T];
    if (map == null) {
      final newMap = <int, _Node<T>>{};
      _entities[T] = newMap;
      return newMap;
    }
    return map.cast<int, _Node<T>>();
  }

  int beginTx() => nextTxId();
  void applyTx<T>({
    required int txId,
    required int id,
    required T Function(T current) mutate,
  }) {
    final node = _map<T>()[id];
    if (node == null) return;

    final before = node.value;
    final after = mutate(before);

    node._txStack.add(_Tx(id: txId, before: before, after: after));

    node.value = after;
  }

  void rollbackTx(int txId) {
    for (final entry in _entities.entries) {
      for (final node in entry.value.values) {
        final txIndex = node._txStack.indexWhere((tx) => tx.id == txId);

        if (txIndex == -1) continue;

        final tx = node._txStack.removeAt(txIndex);

        node.value = tx.before;
      }
    }
  }

  void commitTx(int txId) {
    for (final nodeMap in _entities.values) {
      for (final node in nodeMap.values) {
        final tx = node._txStack.where((t) => t.id == txId);

        for (final t in tx) {
          t.committed = true;
        }

        node._txStack.removeWhere((t) => t.id == txId);
        node.revision++;
      }
    }
  }
}
