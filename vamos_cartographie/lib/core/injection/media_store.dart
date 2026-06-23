import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/trip_domain.dart";
import "package:media_application/media_application.dart";
part "media_store.g.dart";

@riverpod
MediaStore rawMediaStore(Ref ref) => MediaStore();

@riverpod
MediaPatchStore mediaPatchStore(Ref ref) => MediaPatchStore();

@riverpod
ImageProjector imageProjector(Ref ref) {
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final mediaPatchStore = ref.watch(mediaPatchStoreProvider);
  return ImageProjector(store: mediaStore, patches: mediaPatchStore);
}
