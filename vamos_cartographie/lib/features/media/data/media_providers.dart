import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";
import "package:vamos_cartographie/features/media/data/datasources/storage_datasource.dart";
import "datasources/media_remote_datasource.dart";
import "media_repository.dart";

import 'package:dio/dio.dart';

final mediaRemoteDatasourceProvider = Provider<MediaRemoteDatasource>((ref) {
  return MediaRemoteDatasource(ref.watch(clientProvider));
});
final storageDatasourceProvider = Provider<DioStorageDatasource>((ref) {
  return DioStorageDatasource(Dio());
});
final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  return MediaRepository(
    remote: ref.watch(mediaRemoteDatasourceProvider),
    storage: ref.watch(storageDatasourceProvider),
  );
});
