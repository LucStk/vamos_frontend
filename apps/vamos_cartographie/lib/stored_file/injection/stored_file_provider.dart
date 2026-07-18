import "package:dio/dio.dart";
import "package:domain_core/notification/error_logger.dart";
import "package:domain_core/runtime/mutation_queue.dart";
import "package:domain_core/runtime/optimitic_runner.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:stored_file_application/stored_file_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/stored_file/data/stored_file.dart";
import "package:vamos_cartographie/stored_file/data/upload_service_impl.dart";
part "stored_file_provider.g.dart";

@riverpod
StoredFileRemoteDatasource storedFileRemoteDatasource(Ref ref) {
  return StoredFileRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
StoredFileRepository storedFileRepository(Ref ref) {
  final datasource = ref.watch(storedFileRemoteDatasourceProvider);
  return StoredFileRepositoryImpl(remote: datasource);
}

@riverpod
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
  ErrorLogger? get errorLogger => null;
}
