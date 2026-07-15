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
typedef GraphCollectionStore<T extends Patchable<T>> =
    CollectionStore<T, GraphNode<T>>;

/// Store "simple", sans machinerie de patch, juste des T bruts
typedef SimpleCollectionStore<T extends HasId> = CollectionStore<T, T>;

extension GraphCollectionStoreX<T extends Patchable<T>>
    on CollectionStore<T, GraphNode<T>> {
  CollectionStore<T, GraphNode<T>> insertState(NodeState<T> state) =>
      insert(GraphNode<T>(state));

  NodeState<T>? getState(Id<T> id) => get(id)?.current;

  CollectionStore<T, GraphNode<T>> patchNode(
    Patch<T> patch, {
    T? originalValue,
  }) {
    final s = get(patch.id as Id<T>);
    s?.patch(patch, originalValue: originalValue);
    return this;
  }

  CollectionStore<T, GraphNode<T>> set(T value) {
    final s = get(value.id as Id<T>);
    s?.set(value);
    return this;
  }
}
