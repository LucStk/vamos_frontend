import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/application/services/media_services.dart';
import 'package:media_application/patches/media_patch_store.dart';
import 'package:media_application/patches/patch_image.dart';
import 'package:trip_domain/trip_domain.dart';

class MediaHandler {
  MediaPatchStore patchStore;
  OptimisticExecutor executor;
  MediaServices mediaServices;

  MediaHandler(this.patchStore, this.executor, this.mediaServices);

  Future<void> addImage(Id id, PatchImageMedia patch) async {
    await executor.run<MediaImage>(
      onApply: () => patchStore.upsert(id, patch),
      remote: () => mediaServices.uploadAndAttach(id, patch.file),
      onSuccess: (MediaImage _) => patchStore.remove(id, patch.fileKey),
      onError: () =>
          patchStore.updateStatus(id, patch.fileKey, UploadStatus.failure),
    );
  }

  Future<void> removeImage(Id id, FileKey key) async {
    await executor.run<void>(
      onApply: () => mediaServices.detachFromEntity(id, key),
      remote: () => mediaServices.detachFromEntity(id, key),
      onSuccess: (_) {},
      onError: () {}, // re-upsert si besoin
    );
  }

  Future<void> retryImage(Id id, PatchImageMedia patch) async {
    await addImage(id, patch);
  }
}
