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

  Future<void> addImage<T>(Id<T> id, PatchImageMedia patch) async {
    await executor.run<MediaImage>(
      onApply: () => patchStore.upsert(id, patch),
      remote: () => mediaServices.uploadAndAttach<T>(id, patch.file),
      onSuccess: (MediaImage _) => patchStore.remove(id, patch.fileKey),
      onError: () =>
          patchStore.updateStatus(id, patch.fileKey, UploadStatus.failure),
    );
  }

  Future<void> removeImage<T>(Id<T> id, FileKey key) async {
    await executor.run<void>(
      onApply: () => throw ("not Implemented yet"),
      remote: () => mediaServices.detachFromEntity<T>(id, key),
      onSuccess: (_) {},
      onError: () {}, // re-upsert si besoin
    );
  }
}
