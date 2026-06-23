import 'package:domain_core/id.dart';
import 'package:domain_core/media.dart';
import 'package:trip_domain/trip_domain.dart';

class MediaStore<T> {
  final Map<Id<T>, List<MediaImage>> _store = {};

  List<MediaImage> getFor(Id<T> id) => _store[id] ?? [];

  void upsert(Id<T> id, MediaImage image) {
    final current = _store[id] ?? [];
    final updated = [
      ...current.where((i) => i.fileKey != image.fileKey),
      image,
    ];
    _store[id] = updated;
  }

  void remove(Id<T> id, FileKey key) {
    _store[id]?.removeWhere((i) => i.fileKey == key);
  }

  void clear() => _store.clear();
}
