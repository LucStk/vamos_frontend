import 'package:domain_core/domain_core.dart';
import 'observable_graph_node.dart';

class CollectionStore<T extends HasId<T>> {
  final Map<Id<T>, ObservableGraphNode<T>> store = {};

  CollectionStore();

  void clear() => store.clear();

  void insert(T value) => store[value.id] = ObservableGraphNode<T>(value);

  void remove(Id<T> id) {
    getRequired(id);
    store.remove(id);
  }
}

extension CollectionStoreGetterss<T extends HasId<T>> on CollectionStore<T> {
  ObservableGraphNode<T>? getNode(Id<T> id) => store[id];

  ObservableGraphNode<T> getNodeRequired(Id<T> id) {
    final res = getNode(id);
    if (res == null) {
      throw Exception("Id $id of $T not found in store");
    }
    return res;
  }

  T? get(Id<T> id) => getNode(id)?.value;

  T getRequired(Id<T> id) => getNodeRequired(id).value;

  Map<Id<T>, T> getAll() =>
      Map.unmodifiable(store.map((k, v) => MapEntry(k, v.value)));
}
