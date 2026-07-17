import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:stored_file_application/stored_file_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
part "stored_file_provider.g.dart";

@riverpod
StorRemoteDatasource mediaRemoteDatasource(Ref ref) {
  return MediaRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
MediaRepository mediaRepository(Ref ref) {
  final datasource = ref.watch(mediaRemoteDatasourceProvider);
  final dioMedia = ref.watch(dioMediaProvider);
  return MediaRepositoryImpl(remote: datasource, storage: dioMedia);
}

@Riverpod(keepAlive: true)
ObservableMediaStore rawMediaStore(Ref ref) => ObservableMediaStore();
