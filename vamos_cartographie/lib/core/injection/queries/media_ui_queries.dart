import 'package:domain_core/id.dart';
import 'package:media_application/media_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/runtime/store/media_store.dart';
import '/core/injection/stores/media_store.dart';
part 'media_ui_queries.g.dart';

@riverpod
List<ImageUiModel> entityImages(Ref ref, Id id) {
  final mediaStore = ref.watch(mediaStoreProvider);
  final patchStore = ref.watch(mediaPatchStoreProvider);

  return [
    ...mediaStore.getFor(id).values.map((v) => v.toUiModel()),
    ...patchStore
        .getFor(id)
        .values
        .map((v) => v.toUiModel(UploadStatus.success)),
  ];
}
