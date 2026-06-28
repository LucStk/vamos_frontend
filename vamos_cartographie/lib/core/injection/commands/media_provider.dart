import 'package:media_application/media_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/core/injection/stores/media_store.dart';
import 'package:vamos_cartographie/infrastructure/core/erreur_handler.dart';

part 'media_provider.g.dart';

@riverpod
MediaHandler mediaHandler(Ref ref) {
  final patchStore = ref.watch(rawMediaPatchStoreProvider);
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final uploadStore = ref.watch(rawUploadStateStoreProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  final mediaRepo = ref.watch(mediaRepositoryProvider);
  final mediaService = MediaServices(mediaRepo, mediaStore);
  final errorLogger = ErrorHandler.instance;
  return MediaHandler(
    mediaStore,
    patchStore,
    uploadStore,
    executor,
    mediaService,
    errorLogger,
  );
}
