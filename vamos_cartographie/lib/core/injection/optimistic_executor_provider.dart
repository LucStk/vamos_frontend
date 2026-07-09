import 'package:domain_core/optimitic_executor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/core/services/services.dart';

part 'optimistic_executor_provider.g.dart';

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  final errorLogger = ErrorHandler.instance;
  return OptimisticExecutor(errorLogger);
}
