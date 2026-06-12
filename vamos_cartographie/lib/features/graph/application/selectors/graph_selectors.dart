import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/application/providers/graph_providers.dart';
import 'package:vamos_cartographie/features/graph/core/graph_node.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';

part 'graph_selectors.g.dart';

/// ─────────────────────────────────────────────
/// COLLECTION (structure-level)
/// rebuild uniquement si ajout / suppression
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int> collectionListenable<T>(Ref ref) {
  final store = ref.watch(graphStoreProvider);
  return store.collectionSignal<T>();
}

@riverpod
Map<int, T> collection<T>(Ref ref) {
  ref.watch(collectionListenableProvider<T>());

  final store = ref.watch(graphStoreProvider);
  return store.getAll<T>();
}

/// ─────────────────────────────────────────────
/// NODE (fine grain reactive entity)
/// rebuild uniquement si 1 entity change
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int>? nodeListenable<T>(Ref ref, int id) {
  final store = ref.watch(graphStoreProvider);

  return store.node<T>(id)?.listenable;
}

@riverpod
T? node<T>(Ref ref, int id) {
  final store = ref.watch(graphStoreProvider);

  // 👇 déclenche rebuild uniquement si node change
  ref.watch(nodeListenableProvider<T>(id));

  return store.get<T>(id);
}

/// ─────────────────────────────────────────────
/// OPTIONAL: safe required node (throw if missing)
/// ─────────────────────────────────────────────

@riverpod
T nodeRequired<T>(Ref ref, int id) {
  final store = ref.watch(graphStoreProvider);

  ref.watch(nodeListenableProvider<T>(id));

  final value = store.get<T>(id);

  if (value == null) {
    throw StateError('Node $T:$id not found');
  }

  return value;
}

@riverpod
GraphNode<T>? graphNode<T>(Ref ref, int id) {
  final store = ref.watch(graphStoreProvider);
  return store.node<T>(id);
}
