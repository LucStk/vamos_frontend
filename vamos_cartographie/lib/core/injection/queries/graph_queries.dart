import 'package:domain_core/id.dart';
import 'package:media_application/media_application.dart';
import 'package:media_application/patches/upload_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/core/injection/stores/media_store.dart';
part 'graph_queries.g.dart';

@riverpod
FutureOr<List<ImageUiModel>> entityImages(Ref ref, Id id) async {
  final mediaStore = await ref.watch(mediaStoreProvider.future);
  final patchStore = await ref.watch(mediaPatchStoreProvider.future);

  return [
    ...mediaStore.values.map((v) => v.toUiModel()),
    ...patchStore.values.map((v) => v.toUiModel(UploadStatus.success)),
  ];
}
