import 'package:domain_core/id.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/application/services/media_services.dart';
import 'package:media_application/patches/media_patch_store.dart';
import 'package:media_application/patches/patch_image.dart';
import 'package:trip_domain/trip_domain.dart';

class ImagesHandler {
  MediaPatchStore patchStore;
  OptimisticExecutor executor;
  MediaServices mediaServices;

  ImagesHandler(this.patchStore, this.executor, this.mediaServices);

  void addImageToEntity(Id id, PatchImageMedia patch) async {
    await executor.run<MediaImage>(
      onApply: () => patchStore.upsert(id, patch),
      remote: () => mediaServices.uploadAndAttachToEntity(id, patch.file),
      onSuccess: (MediaImage server) => patchStore.remove(id, patch.fileKey),
      onError: () {},
    );
  }
}
