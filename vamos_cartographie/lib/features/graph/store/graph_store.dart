import 'package:vamos_cartographie/core/type/has_id.dart';
import 'package:vamos_cartographie/features/graph/core/core.dart';

class GraphStore {
  final Map<Type, Map<int, Node<dynamic>>> _entities = {};

  int _tempId = -1;
  int nextTempId() => _tempId--;

  Map<int, Node<T>> map<T>() {
    final map = _entities[T];
    if (map == null) {
      final newMap = <int, Node<T>>{};
      _entities[T] = newMap;
      return newMap;
    }
    return map.cast<int, Node<T>>();
  }

  // CREATE
  int create<T>(T Function(int tempId) builder) {
    final id = nextTempId();
    map<T>()[id] = Node<T>(builder(id));
    return id;
  }

  // UPDATE
  T update<T>(int id, T Function(T current) mutate) {
    final node = map<T>()[id];
    if (node?.value == null) {
      throw Exception("id not find in update graph_store");
    }
    final T oldValue = node!.value as T;
    node.value = mutate(node.value as T);
    return oldValue;
  }

  // DELETE
  void delete<T>(int id) {
    final node = map<T>()[id];
    if (node == null) return;

    node.deleted = true;
  }

  // COMMIT
  void commitUpdate<T>(int id, T serverValue) {
    final node = map<T>()[id];
    if (node == null) return;

    node.value = serverValue;
    node.revision++;
    node.deleted = false;
  }

  void commitCreate<T extends HasId>({
    required int tempId,
    required T serverEntity,
  }) {
    final entities = map<T>();
    final node = entities.remove(tempId);
    if (node == null) return;
    node.value = serverEntity;
    node.deleted = false;
    node.revision++;
    entities[serverEntity.id] = node;
  }

  void commitDelete<T>(int id) {
    map<T>().remove(id);
  }

  void rollbackCreate<T>(int id) {
    map<T>().remove(id);
  }

  void rollbackDelete<T>(int id) {
    final node = map<T>()[id];
    if (node == null) return;

    node.deleted = false;
  }
}
