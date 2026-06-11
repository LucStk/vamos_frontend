import 'package:vamos_cartographie/features/graph/infrastructure/graph_store.dart';
import "optimistic_executor.dart";
import "package:riverpod/riverpod.dart";

final graphStoreProvider = Provider<GraphStore>((ref) {
  return GraphStore();
});
final optimisticExecutorProvider = Provider<OptimisticExecutor>((ref) {
  return OptimisticExecutor();
});
