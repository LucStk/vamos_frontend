import 'package:domain_core/domain/domain.dart';
import 'package:domain_core/id.dart';
import 'package:stored_file_application/domain/domain.dart';

class StoredFileStore {
  final GraphCollectionStore<StoredFile> storedFileStore;
  StoredFileStore({required this.storedFileStore});

  StoredFileStore.initial()
    : storedFileStore = const GraphCollectionStore<StoredFile>();

  StoredFileStore copyWith({
    GraphCollectionStore<StoredFile>? storedFileStore,
  }) {
    return StoredFileStore(
      storedFileStore: storedFileStore ?? this.storedFileStore,
    );
  }
}

extension StoredFileStoreActions on StoredFileStore {
  StoredFileStore insertPatchMedia(StoredFilePatch patch) {
    return copyWith(
      storedFileStore: storedFileStore.insertState(HasPatch(patch: patch)),
    );
  }

  MediaStore removeMedia(MediaId id) {
    final v = mediaStore.getState(id)?.serverValue;
    final ownerId = v?.owner.id;
    graphStore[ownerId]?.remove(id);
    return copyWith(mediaStore: mediaStore.remove(id));
  }

  void setMedia(StoredFile serverMedia) {
    mediaStore.get(serverMedia.id)?.set(serverMedia);
  }

  void rollbackMedia(MediaId wid) => mediaStore.get(wid)?.rollback();

  MediaStore clear() {
    graphStore = {};
    return copyWith(mediaStore: GraphCollectionStore<StoredFile>());
  }
}

extension MediaStoreGetters on MediaStore {
  List<MediaId>? getFromOwner(MediaId mId) {
    return graphStore[mId];
  }
}
