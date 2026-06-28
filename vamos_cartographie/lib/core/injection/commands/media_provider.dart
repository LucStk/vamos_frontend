import 'package:media_application/application/commands/media_handler.dart';
import 'package:media_application/application/services/media_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/core/injection/stores/media_store.dart';

part 'media_provider.g.dart';

@riverpod
MediaHandler mediaHandler(Ref ref) {
  final patchStore = ref.watch(rawMediaPatchStoreProvider);
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final uploadStore = ref.watch(rawUploadStateStoreProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  final mediaRepo = ref.watch(mediaRepositoryProvider);
  final mediaService = MediaServices(mediaRepo, mediaStore);
  return MediaHandler(
    mediaStore,
    patchStore,
    uploadStore,
    executor,
    mediaService,
  );
}
