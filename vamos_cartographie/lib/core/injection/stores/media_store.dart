import "dart:async";

import "package:domain_core/media.dart";
import "package:media_application/patches/patch_image.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/trip_domain.dart";
import "package:media_application/media_application.dart";
import "package:vamos_cartographie/core/injection/dio_media_provider.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/core/injection/observable_node_impl.dart";
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

@riverpod
MediaStore rawMediaStore(Ref ref) => MediaStore(ObservableNodeImpl());

@riverpod
MediaPatchStore rawMediaPatchStore(Ref ref) =>
    MediaPatchStore(ObservableNodeImpl());

@riverpod
Stream<Map<FileKey, MediaImage>> mediaStore(Ref ref) {
  final store = ref.watch(rawMediaStoreProvider);
  final controller = StreamController<Map<FileKey, MediaImage>>();
  controller.add(Map.unmodifiable(store.store));
  void listener() => controller.add(Map.unmodifiable(store.store));

  store.observableNode.addListener(listener);

  ref.onDispose(() {
    store.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}

@riverpod
Stream<Map<FileKey, PatchImageMedia>> mediaPatchStore(Ref ref) {
  final store = ref.watch(rawMediaPatchStoreProvider);
  final controller = StreamController<Map<FileKey, PatchImageMedia>>();
  controller.add(Map.unmodifiable(store.patchImages));
  void listener() => controller.add(Map.unmodifiable(store.patchImages));

  store.observableNode.addListener(listener);

  ref.onDispose(() {
    store.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}
