import 'package:domain_core/optimitic_executor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/application/commands/commands.dart';
import 'package:trip_domain/application/repositories/trip_repository.dart';

import "package:vamos_cartographie/core/injection/client_provider.dart";
import 'package:vamos_cartographie/core/injection/commands_provider.dart/topology_providers.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/core/injection/stores_provider.dart';
import '/infrastructure/trip/trip_remote_datasource.dart';
import '/infrastructure/trip/trip_repository_impl.dart';
part 'trip_provider.g.dart';

@riverpod
TripRemoteDatasource tripRemoteDatasource(Ref ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TripRepository tripRepository(Ref ref) {
  return TripRepositoryImpl(ref.watch(tripRemoteDatasourceProvider));
}

@riverpod
TripHandler tripHandler(Ref ref) {
  final tripStore = ref.watch(tripStoreProvider);
  final OptimisticExecutor executor = ref.watch(optimisticExecutorProvider);
  final repo = ref.watch(tripRepositoryProvider);
  return TripHandler(tripStore, repo, executor);
}
