import 'package:domain_core/domain_core.dart';

class CollectionStore<T extends HasId> {
  final Map<Id, ObservableGraphNode<T>> store = {};

  CollectionStore();

  void clear() => store.clear();

  void update(T value) {
    store[value.id]!.set(value);
  }

  void insert(T value) => store[value.id] = ObservableGraphNode<T>(value);

  void remove(Id<T> id) {
    getRequired(id);
    store.remove(id);
  }
}

extension CollectionStoreGetters<T extends HasId> on CollectionStore<T> {
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

  List<Id<T>> getIds() => store.keys.toList() as List<Id<T>>;
}
