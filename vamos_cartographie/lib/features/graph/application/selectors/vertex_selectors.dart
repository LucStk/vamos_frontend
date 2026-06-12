import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/graph/store/graph_store.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

part 'vertex_selectors.g.dart';

/// ─────────────────────────────────────────────
/// COLLECTION (list / map / layers)
/// Rebuild uniquement si structure change
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int> vertexCollectionRevision(Ref ref) {
  return ref.watch(graphStoreProvider).collection<Vertex>().revision;
}

/// ─────────────────────────────────────────────
/// NODE (fine grain update per entity)
/// Rebuild uniquement si UN vertex change
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int>? vertexNodeRevision(Ref ref, int id) {
  final graph = ref.watch(graphStoreProvider);

  return graph.map<Vertex>()[id]?.listenable;
}

/// ─────────────────────────────────────────────
/// SNAPSHOT SIMPLE (non réactif fin)
/// Lecture directe (optimisé pour dialogs / one-shot UI)
/// ─────────────────────────────────────────────

@riverpod
Vertex? vertex(Ref ref, int id) {
  return ref.watch(graphStoreProvider).get<Vertex>(id);
}

/// ─────────────────────────────────────────────
/// SAFE REACTIVE ENTITY (RECOMMANDÉ UI)
/// Combine :
/// - accès valeur
/// - réactivité node
/// - safe null handling
/// ─────────────────────────────────────────────

@riverpod
class VertexWatch extends _$VertexWatch {
  @override
  Vertex? build(int id) {
    final graph = ref.watch(graphStoreProvider);

    final node = graph.map<Vertex>()[id];
    if (node == null) return null;

    // IMPORTANT : déclenche rebuild quand node change
    node.listenable;

    return node.value;
  }
}

/// ─────────────────────────────────────────────
/// SEGMENT (même pattern pour cohérence topo)
/// ─────────────────────────────────────────────

@riverpod
ValueListenable<int> segmentCollectionRevision(Ref ref) {
  return ref.watch(graphStoreProvider).collection<Segment>().revision;
}

@riverpod
ValueListenable<int>? segmentNodeRevision(Ref ref, int id) {
  final graph = ref.watch(graphStoreProvider);

  return graph.map<Segment>()[id]?.listenable;
}

@riverpod
Segment? segment(Ref ref, int id) {
  return ref.watch(graphStoreProvider).get<Segment>(id);
}

@riverpod
class SegmentWatch extends _$SegmentWatch {
  @override
  Segment? build(int id) {
    final graph = ref.watch(graphStoreProvider);

    final node = graph.map<Segment>()[id];
    if (node == null) return null;

    node.listenable;

    return node.value;
  }
}
