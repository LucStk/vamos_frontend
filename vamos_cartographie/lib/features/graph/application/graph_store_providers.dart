import 'package:vamos_cartographie/features/graph/infrastructure//optimistic_graph_store.dart';
import "optimistic_executor.dart";
import "package:riverpod/riverpod.dart";

final graphStoreProvider = Provider<OptimisticGraphStore>((ref) {
  return OptimisticGraphStore();
});
final optimisticExecutorProvider = Provider<OptimisticExecutor>((ref) {
  return OptimisticExecutor();
});
