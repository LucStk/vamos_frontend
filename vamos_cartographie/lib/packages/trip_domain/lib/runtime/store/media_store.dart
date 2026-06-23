import 'package:domain_core/id.dart';
import 'package:domain_core/media.dart';
import 'package:trip_domain/trip_domain.dart';

class MediaStore {
  final Map<Id<dynamic>, Map<FileKey, MediaImage>> _store = {};

  Map<FileKey, MediaImage> getFor(Id id) => _store[id] ?? {};

  void upsert(Id id, MediaImage image) {
    var current = _store[id];
    if (current != null) {
      current[image.fileKey] = image;
    } else {
      _store[id] = {image.fileKey: image};
    }
  }

  void remove(Id id, FileKey key) => _store[id]?.remove(key);

  void clear() => _store.clear();
}
