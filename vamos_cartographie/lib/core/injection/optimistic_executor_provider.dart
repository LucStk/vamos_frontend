import 'package:domain_core/optimitic_executor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import "package:vamos_cartographie/core/injection/client_provider.dart";
import '/infrastructure/trip/trip_remote_datasource.dart';
part 'optimistic_executor_provider.g.dart';

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  return OptimisticExecutor();
}
