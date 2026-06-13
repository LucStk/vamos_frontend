import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/application/providers/graph_providers.dart';
import 'package:vamos_cartographie/features/graph/core/graph_node.dart';
import 'package:vamos_cartographie/features/trips/application/selectors/trips_selectors.dart';

part 'graph_selectors.g.dart';

/// ─────────────────────────────────────────────
/// COLLECTION (structure-level)
/// rebuild uniquement si ajout / suppression
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int> collectionListenable<T>(Ref ref, int tripId) {
  final store = ref.watch(graphStoreProvider(tripId));
  return store.collectionSignal<T>();
}

@riverpod
Map<int, T> collection<T>(Ref ref, int tripId) {
  ref.watch(collectionListenableProvider<T>(tripId));

  final store = ref.watch(graphStoreProvider(tripId));
  return store.getAll<T>();
}

/// ─────────────────────────────────────────────
/// NODE (fine grain reactive entity)
/// rebuild uniquement si 1 entity change
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int>? nodeListenable<T>(Ref ref, int tripId, int id) {
  final store = ref.watch(graphStoreProvider(tripId));

  return store.node<T>(id)?.listenable;
}

@riverpod
T? node<T>(Ref ref, int tripId, int id) {
  final store = ref.watch(graphStoreProvider(tripId));

  // 👇 déclenche rebuild uniquement si node change
  ref.watch(nodeListenableProvider<T>(id, tripId));

  return store.get<T>(id);
}

/// ─────────────────────────────────────────────
/// OPTIONAL: safe required node (throw if missing)
/// ─────────────────────────────────────────────

@riverpod
T nodeRequired<T>(Ref ref, int id, int tripId) {
  final store = ref.watch(graphStoreProvider(tripId));

  ref.watch(nodeListenableProvider<T>(id, tripId));

  final value = store.get<T>(id);

  if (value == null) {
    throw StateError('Node $T:$id not found');
  }

  return value;
}

@riverpod
GraphNode<T>? graphNode<T>(Ref ref, int id, int tripId) {
  final store = ref.watch(graphStoreProvider(tripId));
  return store.node<T>(id);
}
