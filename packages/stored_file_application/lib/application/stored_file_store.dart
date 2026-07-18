import 'package:domain_core/domain/domain.dart';
import 'package:domain_core/id.dart';
import 'package:stored_file_application/application/owner_index.dart';
import 'package:stored_file_application/domain/domain.dart';

class StoredFileStore {
  final GraphCollectionStore<StoredFileFields> storedFileStore;
  OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex;

  StoredFileStore({required this.storedFileStore, required this.ownerIndex});

  StoredFileStore.initial()
    : ownerIndex = OwnerIndex(),
      storedFileStore = const GraphCollectionStore<StoredFileFields>();

  StoredFileStore copyWith({
    GraphCollectionStore<StoredFileFields>? storedFileStore,
  }) {
    return StoredFileStore(
      storedFileStore: storedFileStore ?? this.storedFileStore,
      ownerIndex: ownerIndex,
    );
  }
}

extension StoredFileStoreActions on StoredFileStore {
  StoredFileStore insertStoredFile(Id ownerId, StoredFileFields file) {
    ownerIndex.addRelationship(ownerId, file.id);
    return copyWith(storedFileStore: storedFileStore.insertState(file));
  }

  StoredFileStore removeMedia(StoredFileId id) {
    ownerIndex.removeOwned(id);
    return copyWith(storedFileStore: storedFileStore.remove(id));
  }

  void rollbackMedia(StoredFileId wid) => storedFileStore.get(wid)?.rollback();

  StoredFileStore clear() {
    ownerIndex.clear();
    return copyWith(storedFileStore: GraphCollectionStore<StoredFileFields>());
  }
}

extension StoredFileStoreGetters on StoredFileStore {
  List<StoredFileId>? getFromOwner(Id mId) {
    return ownerIndex.owneds(mId)?.toList();
  }
}
