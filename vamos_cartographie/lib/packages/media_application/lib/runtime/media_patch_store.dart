import 'package:domain_core/domain_core.dart';
import '/domain/domain.dart';

class MediaPatchStore {
  final Map<Id, Map<FileKey, PatchImageMedia>> patchImages = {};

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

  void remove(Id id, FileKey key) {
    patchImages[id]?.remove(key);
  }
}
