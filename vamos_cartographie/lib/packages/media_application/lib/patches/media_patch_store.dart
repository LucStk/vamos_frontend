import 'package:domain_core/domain_core.dart';
import 'package:media_application/patches/patch_image.dart';

class MediaPatchStore {
  final Map<Id, Map<FileKey, PatchImageMedia>> patchImages = {};
  MediaPatchStore();

  void clear() {
    patchImages.clear();
  }

  Map<FileKey, PatchImageMedia> get(Id id) => patchImages[id] ?? {};

  void upsert(Id id, PatchImageMedia patch) {
    var current = patchImages[id];
    if (current != null) {
      current[patch.fileKey] = patch;
    } else {
      patchImages[id] = {patch.fileKey: patch};
    }
  }

  void updateStatus(Id id, FileKey key, UploadStatus status) {
    final patch = patchImages[id]?[key];
    if (patch == null) return;
    patchImages[id]![key] = patch.copyWith(uploadStatus: status);
  }

  void remove(Id id, FileKey key) => patchImages[id]?.remove(key);
}
