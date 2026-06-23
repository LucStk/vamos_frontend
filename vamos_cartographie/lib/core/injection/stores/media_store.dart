import "dart:async";

import "package:domain_core/media.dart";
import "package:media_application/patches/patch_image.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/trip_domain.dart";
import "package:media_application/media_application.dart";
import "package:vamos_cartographie/core/injection/observable_node_impl.dart";
part "media_store.g.dart";

@riverpod
MediaStore rawMediaStore(Ref ref) => MediaStore(ObservableNodeImpl());

@riverpod
MediaPatchStore rawMediaPatchStore(Ref ref) =>
    MediaPatchStore(ObservableNodeImpl());

@riverpod
Stream<Map<FileKey, MediaImage>> mediaStore(Ref ref) {
  final store = ref.watch(rawMediaStoreProvider);
  final controller = StreamController<Map<FileKey, MediaImage>>();

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

  void listener() => controller.add(Map.unmodifiable(store.patchImages));

  store.observableNode.addListener(listener);

  ref.onDispose(() {
    store.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}
