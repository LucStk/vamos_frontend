import 'package:domain_core/domain_core.dart';
import 'package:trip_application/shared/graph_node_state.dart';
import 'graph_node.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_store.freezed.dart';

@freezed
abstract class CollectionStore<T extends Patchable<T>>
    with _$CollectionStore<T> {
  // On utilise un constructeur privé pour pouvoir ajouter des méthodes et des getters
  const CollectionStore._();

  const factory CollectionStore({@Default({}) Map<Id<T>, GraphNode<T>> store}) =
      _CollectionStore<T>;

  // --- Actions (qui retournent une nouvelle instance) ---

  CollectionStore<T> clear() {
    final updated = copyWith(store: {});
    return updated;
  }

  CollectionStore<T> upsert(NodeState<T> state) {
    final newStore = Map<Id<T>, GraphNode<T>>.from(store);
    // Ici, state.id fonctionne si NodeState<T> expose bien 'id'
    newStore[state.id] = GraphNode<T>(state);

    final updated = copyWith(store: newStore);
    return updated;
  }

  CollectionStore<T> remove(Id<T> id) {
    final newStore = Map<Id<T>, GraphNode<T>>.from(store)..remove(id);
    final updated = copyWith(store: newStore);
    return updated;
  }
}

// --- Les Getters (Extension) ---

extension CollectionStoreGetters<T extends Patchable<T>> on CollectionStore<T> {
  GraphNode? getNode(Id<T> id) => store[id];

  GraphNode getNodeRequired(Id<T> id) {
    final res = getNode(id);
    if (res == null) {
      throw Exception("Id $id of $T not found in store");
    }
    return res;
  }

  List<Id<T>> getIds() => store.keys.toList();
}
