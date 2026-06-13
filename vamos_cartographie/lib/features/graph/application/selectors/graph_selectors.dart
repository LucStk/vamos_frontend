import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/providers/graph_providers.dart';
import 'package:vamos_cartographie/features/graph/core/graph_node.dart';

part 'graph_selectors.g.dart';

/// ─────────────────────────────────────────────
/// COLLECTION (structure-level)
/// rebuild uniquement si ajout / suppression
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int> collectionListenable<T>(Ref ref, Id<Trip> tripId) {
  final store = ref.watch(graphStoreProvider(tripId));
  return store.collectionSignal<T>();
}

@riverpod
Map<Id<T>, T> collection<T>(Ref ref, Id<Trip> tripId) {
  ref.watch(collectionListenableProvider<T>(tripId));

  final store = ref.watch(graphStoreProvider(tripId));
  return store.getAll<T>();
}

/// ─────────────────────────────────────────────
/// NODE (fine grain reactive entity)
/// rebuild uniquement si 1 entity change
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int>? nodeListenable<T>(Ref ref, Id<Trip> tripId, Id<T> id) {
  final store = ref.watch(graphStoreProvider(tripId));

  return store.node<T>(id)?.listenable;
}

@riverpod
T? node<T>(Ref ref, Id<Trip> tripId, Id<T> id) {
  final store = ref.watch(graphStoreProvider(tripId));

  // 👇 déclenche rebuild uniquement si node change
  ref.watch(nodeListenableProvider<T>(tripId, id));

  return store.get<T>(id);
}

/// ─────────────────────────────────────────────
/// OPTIONAL: safe required node (throw if missing)
/// ─────────────────────────────────────────────

@riverpod
T nodeRequired<T>(Ref ref, Id<Trip> tripId, Id<T> id) {
  final store = ref.watch(graphStoreProvider(tripId));

  ref.watch(nodeListenableProvider<T>(tripId, id));

  final value = store.get<T>(id);

  if (value == null) {
    throw StateError('Node $T:$id not found');
  }

  return value;
}

@riverpod
GraphNode<T>? graphNode<T>(Ref ref, Id<Trip> tripId, Id<T> id) {
  final store = ref.watch(graphStoreProvider(tripId));
  return store.node<T>(id);
}
