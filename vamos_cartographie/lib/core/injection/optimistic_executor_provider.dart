import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/core/services/services.dart';

import 'package:domain_core/domain_core.dart';
part 'optimistic_executor_provider.g.dart';

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  final errorLogger = ErrorHandler.instance;
  return OptimisticExecutor(errorLogger);
}
