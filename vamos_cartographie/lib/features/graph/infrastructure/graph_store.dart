import 'package:vamos_cartographie/core/type/has_id.dart';

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
  bool deleted = false;
  int revision = 0;
  final List<_Tx<T>> _txStack = [];
  _Node(this.value);
}

class GraphStore {
  final Map<Type, Map<int, _Node<dynamic>>> _entities = {};
  int _tempId = -1;
  int nextTempId() => _tempId--;

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

  int applyCreateTx<T>({
    required int txId,
    required T Function(int tempId) create,
  }) {
    final tempId = nextTempId();
    final node = _Node<T>(create(tempId));

    node._txStack.add(_Tx(id: txId, before: node.value, after: node.value));

    _map<T>()[tempId] = node;

    return tempId;
  }

  void applyDeleteTx<T>({required int txId, required int id}) {
    final node = _map<T>()[id];
    if (node == null) return;

    node._txStack.add(_Tx(id: txId, before: node.value, after: node.value));

    node.deleted = true;
  }

  void rollbackTx(int txId) {
    for (final nodeMap in _entities.values) {
      for (final node in nodeMap.values) {
        final index = node._txStack.indexWhere((t) => t.id == txId);

        if (index == -1) continue;

        final tx = node._txStack.removeAt(index);

        node.value = tx.before;
        node.deleted = false;
      }
    }
  }

  void commitTx(int txId) {
    for (final nodeMap in _entities.values) {
      for (final node in nodeMap.values) {
        final hasTx = node._txStack.any((t) => t.id == txId);

        if (!hasTx) continue;

        node._txStack.removeWhere((t) => t.id == txId);

        node.revision++;
        node._txStack.clear();

        // 🔥 suppression réelle
        node.value = null;
        node.deleted = true;
      }
    }
  }

  void commitCreateTx<T>({
    required int txId,
    required int tempId,
    required T serverEntity,
  }) {
    final map = _map<T>();

    final node = map[tempId];
    if (node == null) return;

    // ❌ remove temp
    map.remove(tempId);

    // 🔁 replace with real id
    final realNode = _Node<T>(serverEntity)..revision = node.revision + 1;

    map[(serverEntity as HasId).id] = realNode;

    node._txStack.clear();
  }

  void rollbackCreateTx<T>(int tempId) {
    final map = _map<T>();
    map.remove(tempId);
  }
}
