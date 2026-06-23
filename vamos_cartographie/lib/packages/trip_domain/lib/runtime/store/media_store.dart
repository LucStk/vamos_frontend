import 'package:domain_core/id.dart';
import 'package:domain_core/media.dart';
import 'package:domain_core/observable_node.dart';
import 'package:trip_domain/trip_domain.dart';

class MediaStore {
  final Map<Id<dynamic>, Map<FileKey, MediaImage>> store = {};
  final ObservableNode observableNode;
  MediaStore(this.observableNode);

  Map<FileKey, MediaImage> getFor(Id id) => store[id] ?? {};

  void upsert(Id id, MediaImage image) {
    var current = store[id];
    if (current != null) {
      current[image.fileKey] = image;
    } else {
      store[id] = {image.fileKey: image};
    }
    observableNode.notify();
  }

  void remove(Id id, FileKey key) {
    store[id]?.remove(key);
    observableNode.notify();
  }

  void clear() {
    store.clear();
    observableNode.notify();
  }
}
