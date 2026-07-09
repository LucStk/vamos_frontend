import 'package:media_application/media_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/media/injection/media_store.dart';

part 'media_handler.g.dart';

@riverpod
MediaHandler mediaHandler(Ref ref) {
  final patchStore = ref.watch(rawMediaPatchStoreProvider);
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final uploadStore = ref.watch(rawUploadStateStoreProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  final mediaRepo = ref.watch(mediaRepositoryProvider);
  return MediaHandler(mediaStore, patchStore, uploadStore, executor, mediaRepo);
}
