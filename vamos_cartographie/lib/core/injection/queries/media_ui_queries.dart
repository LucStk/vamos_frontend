import 'package:domain_core/id.dart';
import 'package:media_application/media_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/runtime/store/media_store.dart';
import '/core/injection/stores/media_store.dart';
part 'media_ui_queries.g.dart';

@riverpod
List<ImageUiModel> visibleImages(Ref ref, Id id) {
  final mediaStore = ref.watch(mediaStoreProvider);
  final patchStore = ref.watch(mediaPatchStoreProvider);
  final uploadStore = ref.watch(uploadStateStoreProvider);

  return [
    ...mediaStore.getFor(id).values.map((img) => img.toUiModel()),
    ...patchStore.getFor(id).values.map((patch) {
      final upload = uploadStore.get(patch.fileKey);

      return ImageUiModel(
        fileKey: patch.fileKey,
        imageLocation: LocalPath(patch.file),
        uploadStatus: upload?.status ?? UploadStatus.idle,
        progress: upload == null || upload.total == 0 || upload.total == null
            ? 0
            : (upload.sent ?? 0) / (upload.total ?? 1),
        error: upload?.error,
      );
    }),
  ];
}

@riverpod
List<ImageUiModel> syncedImages(Ref ref, Id id) {
  final mediaStore = ref.watch(mediaStoreProvider);
  return mediaStore.getFor(id).values.map((img) => img.toUiModel()).toList();
}
