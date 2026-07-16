import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:media_application/media_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/media/data/media.dart";
part "media_store.g.dart";

@riverpod
MediaRemoteDatasource mediaRemoteDatasource(Ref ref) {
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

@Riverpod(keepAlive: true)
@riverpod
ObservableMediaPatchStore rawMediaPatchStore(Ref ref) =>
    ObservableMediaPatchStore();

@Riverpod(keepAlive: true)
@riverpod
ObservableUploadStateStore rawUploadStateStore(Ref ref) =>
    ObservableUploadStateStore();
