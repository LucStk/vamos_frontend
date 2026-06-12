import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

part 'graph_selectors.g.dart';

/// ─────────────────────────────────────────────
/// COLLECTION (list / map / layers)
/// Rebuild uniquement si structure change
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int> collectionListenable<T>(Ref ref) {
  // Signal layer
  final store = ref.watch(graphStoreProvider);
  return store.collectionSignal<T>();
}

@riverpod
Map<int, T> collection<T>(Ref ref) {
  // Data layer
  ref.watch(collectionListenableProvider<T>());

  final store = ref.watch(graphStoreProvider);
  return store.getAll<T>();
}
