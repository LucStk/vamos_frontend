import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/runtime/store/nodes/graph_node.dart';
import 'package:vamos_cartographie/core/injection/topology_providers.dart';

part 'graph_selectors.g.dart';

/// ======================================================
/// COLLECTION
/// ======================================================

@riverpod
Map<Id<T>, T> collection<T>(Ref ref, Id<Trip> tripId) {
  final store = ref.watch(tripGraphProvider(tripId)).requireValue;
  void listener() {
    // Remplace ref.notifyListeners() par invalidateSelf()
    ref.invalidateSelf();
  }

  store.collectionSignal<T>().addListener(listener);

  ref.onDispose(() {
    store.collectionSignal<T>().removeListener(listener);
  });

  return store.getAll<T>();
}

/// ======================================================
/// GRAPH NODE
/// Riverpod écoute directement le ChangeNotifier
/// ======================================================

@riverpod
GraphNode<T>? graphNode<T>(Ref ref, Id<Trip> tripId, Id<T> id) {
  // Récupère l'état du store une fois chargé
  final store = ref.watch(tripGraphProvider(tripId)).requireValue;
  final node = store.node<T>(id);

  if (node != null) {
    void listener() {
      ref.notifyListeners();
    }

    node.addListener(listener);

    ref.onDispose(() {
      node.removeListener(listener);
    });
  }

  return node;
}

/// ======================================================
/// NODE VALUE
/// ======================================================

@riverpod
T? node<T>(Ref ref, Id<Trip> tripId, Id<T> id) {
  final node = ref.watch(graphNodeProvider<T>(tripId, id));

  return node?.value;
}

/// ======================================================
/// REQUIRED NODE
/// ======================================================

@riverpod
T nodeRequired<T>(Ref ref, Id<Trip> tripId, Id<T> id) {
  final value = ref.watch(nodeProvider<T>(tripId, id));

  if (value == null) {
    throw StateError('Node $T:$id not found');
  }

  return value;
}
