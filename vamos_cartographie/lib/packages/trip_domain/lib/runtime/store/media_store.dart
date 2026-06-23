import 'package:domain_core/id.dart';
import 'package:domain_core/media.dart';
import 'package:trip_domain/trip_domain.dart';

class MediaStore {
  final Map<Id<dynamic>, List<MediaImage>> _store = {};

  List<MediaImage> getFor(Id id) => _store[id] ?? [];

  void upsert(Id id, MediaImage image) {
    final current = _store[id] ?? [];
    final updated = [
      ...current.where((i) => i.fileKey != image.fileKey),
      image,
    ];
    _store[id] = updated;
  }

  void remove(Id id, FileKey key) {
    _store[id]?.removeWhere((i) => i.fileKey == key);
  }

  void clear() => _store.clear();
}
