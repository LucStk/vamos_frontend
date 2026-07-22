import 'package:domain_core/domain_core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_store.freezed.dart';

@freezed
abstract class CollectionStore<T, V extends HasId>
    with _$CollectionStore<T, V> {
  const CollectionStore._();

  const factory CollectionStore({@Default({}) Map<Id<T>, V> store}) =
      _CollectionStore<T, V>;

  // --- Actions ---

  CollectionStore<T, V> clear() => copyWith(store: {});

  CollectionStore<T, V> insert(V entry) {
    final newStore = Map<Id<T>, V>.from(store);
    newStore[entry.id as Id<T>] = entry;
    return copyWith(store: newStore);
  }

  CollectionStore<T, V> remove(Id<T> id) {
    final newStore = Map<Id<T>, V>.from(store)..remove(id);
    return copyWith(store: newStore);
  }
}

// --- Getters communs ---
extension CollectionStoreGetters<T, V extends HasId> on CollectionStore<T, V> {
  V? get(Id<T> id) => store[id];

  V getRequired(Id<T> id) {
    final res = get(id);
    if (res == null) {
      throw Exception("Id $id of $T not found in store");
    }
    return res;
  }

  List<Id<T>> getIds() => store.keys.toList();
}

/// Store "avec état optimiste / patch" — équivalent à l'ancien CollectionStore<T>
typedef GraphCollectionStore<T extends HasId> =
    CollectionStore<T, GraphNode<T>>;

/// Store "simple", sans machinerie de patch, juste des T bruts
typedef SimpleCollectionStore<T extends HasId> = CollectionStore<T, T>;

extension GraphCollectionStoreX<T extends HasId>
    on CollectionStore<T, GraphNode<T>> {
  CollectionStore<T, GraphNode<T>> insertState(T state) =>
      insert(GraphNode<T>.initial(state));

  CollectionStore<T, GraphNode<T>> updateNode(
    Id<T> id,
    GraphNode<T> Function(GraphNode<T> node) update,
  ) {
    final node = getRequired(id);

    final newStore = Map<Id<T>, GraphNode<T>>.from(store);
    newStore[id] = update(node);

    return copyWith(store: newStore);
  }

  CollectionStore<T, GraphNode<T>> setNode(T value) =>
      updateNode(value.id as Id<T>, (node) => node.set(value));

  CollectionStore<T, GraphNode<T>> rollbackNode(Id<T> id) =>
      updateNode(id, (node) => node.rollback());

  CollectionStore<T, GraphNode<T>> replaceNode(GraphNode<T> node) {
    final newStore = Map<Id<T>, GraphNode<T>>.from(store);
    newStore[node.id] = node;

    return copyWith(store: newStore);
  }

  CollectionStore<T, GraphNode<T>> replaceState(T state) =>
      replaceNode(GraphNode<T>.initial(state));
}
