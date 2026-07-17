import 'package:domain_core/domain/domain.dart';
import 'package:domain_core/id.dart';
import 'package:stored_file_application/application/owner_index.dart';
import 'package:stored_file_application/domain/domain.dart';

class StoredFileStore {
  final GraphCollectionStore<StoredFile> storedFileStore;
  OwnerIndex<Id<dynamic>, Id<StoredFile>> ownerIndex;

  StoredFileStore({required this.storedFileStore, required this.ownerIndex});

  StoredFileStore.initial()
    : ownerIndex = OwnerIndex(),
      storedFileStore = const GraphCollectionStore<StoredFile>();

  StoredFileStore copyWith({
    GraphCollectionStore<StoredFile>? storedFileStore,
  }) {
    return StoredFileStore(
      storedFileStore: storedFileStore ?? this.storedFileStore,
      ownerIndex: ownerIndex,
    );
  }
}

extension StoredFileStoreActions on StoredFileStore {
  StoredFileStore insertPatchMedia(Id ownerId, StoredFilePatch patch) {
    ownerIndex.addRelationship(ownerId, patch.id);
    return copyWith(
      storedFileStore: storedFileStore.insertState(HasPatch(patch: patch)),
    );
  }

  StoredFileStore removeMedia(Id<StoredFile> id) {
    ownerIndex.removeOwned(id);
    return copyWith(storedFileStore: storedFileStore.remove(id));
  }

  void setMedia(StoredFile serverMedia) {
    storedFileStore.get(serverMedia.id)?.set(serverMedia);
  }

  void rollbackMedia(Id<StoredFile> wid) =>
      storedFileStore.get(wid)?.rollback();

  StoredFileStore clear() {
    ownerIndex.clear();
    return copyWith(storedFileStore: GraphCollectionStore<StoredFile>());
  }
}

extension StoredFileStoreGetters on StoredFileStore {
  List<Id<StoredFile>>? getFromOwner(Id mId) {
    return ownerIndex.owneds(mId)?.toList();
  }
}
