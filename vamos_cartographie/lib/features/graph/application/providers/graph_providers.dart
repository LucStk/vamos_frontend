import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:vamos_cartographie/features/graph/graph.dart";
import "package:vamos_cartographie/features/graph/store/graph_store.dart";
part "graph_providers.g.dart";

@riverpod
GraphStore graphStore(Ref ref) {
  return GraphStore();
}

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  return OptimisticExecutor();
}
