import "package:dio/dio.dart";
import "package:domain_core/notification/error_logger.dart";
import "package:domain_core/runtime/mutation_queue.dart";
import "package:domain_core/runtime/optimitic_runner.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:stored_file_application/stored_file_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/domain_features/stored_file/data/data.dart";
part "stored_file_provider.g.dart";

@Riverpod(keepAlive: true)
StoredFileRemoteDatasource storedFileRemoteDatasource(Ref ref) {
  return StoredFileRemoteDatasource(ref.watch(clientProvider));
}

@Riverpod(keepAlive: true)
StoredFileRepository storedFileRepository(Ref ref) {
  final datasource = ref.watch(storedFileRemoteDatasourceProvider);
  return StoredFileRepositoryImpl(remote: datasource);
}

@Riverpod(keepAlive: true)
UploadService uploadService(Ref ref) {
  final repo = ref.read(storedFileRepositoryProvider);
  return UploadServiceImpl(dio: Dio(), storedFileRepo: repo);
}

@Riverpod(keepAlive: true)
class StoredFileStoreNotifier extends _$StoredFileStoreNotifier
    with OptimisticRunner<StoredFileStore>, StoredFileEditor {
  @override
  StoredFileStore build() => StoredFileStore.initial();

  // Injection des dépendances requises par le mixin TopologyHandler
  @override
  StoredFileRepository get storedFileRepo =>
      ref.read(storedFileRepositoryProvider);

  @override
  MutationQueue get mutationQueue => ref.read(mutationQueueProvider);
  @override
  UploadService get uploadService => ref.read(uploadServiceProvider);
  @override
  ErrorLogger? get errorLogger => ref.read(errorLoggerProvider);

  void emit(StoredFileStore newStoredFileStore) {
    state = newStoredFileStore;
  }
}
