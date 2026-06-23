import 'package:domain_core/optimitic_executor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'optimistic_executor_provider.g.dart';

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  return OptimisticExecutor();
}
