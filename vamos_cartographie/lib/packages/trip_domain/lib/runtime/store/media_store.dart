import 'package:domain_core/media.dart';
import 'package:trip_domain/trip_domain.dart';

class MediaStore {
  final Map<FileKey, MediaImage> store = {};

  MediaStore();

  void clear() {
    store.clear();
  }

  MediaImage? get(FileKey key) => store[key];

  MediaImage getRequired(FileKey key) {
    var r = get(key);
    if (r == null) {
      throw Exception("Image $key not found in store");
    }
    return r;
  }

  void upsert(MediaImage image) => store[image.fileKey] = image;
  void remove(FileKey key) => store.remove(key);
}
