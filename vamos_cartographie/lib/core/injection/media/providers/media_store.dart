import "package:flutter/rendering.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:media_application/media_application.dart";
import "package:vamos_cartographie/core/injection/media/providers/dio_media_provider.dart";
import "package:vamos_cartographie/core/injection/services/add_listener_to_observable.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/infrastructure/media/media_remote_datasource.dart";
import "package:vamos_cartographie/infrastructure/media/media_repository_impl.dart";
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

@riverpod
ObservableMediaStore mediaStore(Ref ref) {
  final store = ref.watch(rawMediaStoreProvider);
  addListenerRebuild(ref, store);
  return store;
}

@riverpod
ObservableMediaPatchStore mediaPatchStore(Ref ref) {
  final store = ref.watch(rawMediaPatchStoreProvider);
  addListenerRebuild(ref, store);
  debugPrint("MediaStore $store");
  return store;
}

@riverpod
ObservableUploadStateStore uploadStateStore(Ref ref) {
  final store = ref.watch(rawUploadStateStoreProvider);
  addListenerRebuild(ref, store);
  return store;
}
