import 'package:domain_core/optimitic_executor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/infrastructure/core/erreur_handler.dart';

part 'optimistic_executor_provider.g.dart';

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  final errorLogger = ErrorHandler.instance;
  return OptimisticExecutor(errorLogger);
}
