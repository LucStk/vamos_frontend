import 'package:domain_core/domain_core.dart';
import '/domain/domain.dart';

class MediaPatchStore {
  final Map<Id, Map<FileKey, PatchImageMedia>> store = {};

  void clear() {
    store.clear();
  }

  Map<FileKey, PatchImageMedia> getFor(Id id) => store[id] ?? {};

  void upsert(Id id, PatchImageMedia patch) {
    var current = store[id];
    if (current != null) {
      current[patch.fileKey] = patch;
    } else {
      store[id] = {patch.fileKey: patch};
    }
  }

  void remove(Id id, FileKey key) {
    store[id]?.remove(key);
  }
}
