import 'package:domain_core/domain_core.dart';
import 'package:media_application/patches/patch_image.dart';

class MediaPatchStore {
  final Map<Id, Map<FileKey, PatchImageMedia>> patchImages = {};
  final ObservableNode observableNode;
  MediaPatchStore(this.observableNode);

  void clear() {
    patchImages.clear();
    observableNode.notify();
  }

  Map<FileKey, PatchImageMedia> get(Id id) => patchImages[id] ?? {};

  void upsert(Id id, PatchImageMedia patch) {
    var current = patchImages[id];
    if (current != null) {
      current[patch.fileKey] = patch;
    } else {
      patchImages[id] = {patch.fileKey: patch};
    }
    observableNode.notify();
  }

  void remove(Id id, FileKey key) {
    patchImages[id]?.remove(key);
    observableNode.notify();
  }
}
