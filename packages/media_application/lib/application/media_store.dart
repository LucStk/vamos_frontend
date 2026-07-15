import 'package:domain_core/id.dart';
import 'package:media_application/domain/domain.dart';

class MediaStore {
  final Map<Id<dynamic>, Map<FileKey, MediaImage>> store = {};
  MediaStore();

  void upsert(Id id, MediaImage image) {
    var current = store[id];
    if (current != null) {
      current[image.fileKey] = image;
    } else {
      store[id] = {image.fileKey: image};
    }
  }

  void remove(Id id, FileKey key) => store[id]?.remove(key);
  void clear() => store.clear();
}

extension MediaStoreGetters on MediaStore {
  Map<FileKey, MediaImage> getFor(Id id) => store[id] ?? {};
}
