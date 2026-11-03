import 'package:domain_core/domain/domain.dart';
import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stored_file_application/application/owner_index.dart';
import 'package:stored_file_application/domain/domain.dart';

part 'stored_file_store.freezed.dart';

@freezed
abstract class StoredFileStore with _$StoredFileStore {
  const StoredFileStore._();

  const factory StoredFileStore({
    required GraphCollectionStore<StoredFileFields> storedFileStore,
    required OwnerIndex<Id<dynamic>, StoredFileId> ownerIndex,
  }) = _StoredFileStore;

  // Pas de `const` : OwnerIndex n'a pas de constructeur const.
  factory StoredFileStore.initial() => StoredFileStore(
    storedFileStore: const GraphCollectionStore<StoredFileFields>(),
    ownerIndex: OwnerIndex<Id<dynamic>, StoredFileId>(),
  );
}

extension StoredFileStoreActions on StoredFileStore {
  // --- Actions qui touchent l'index : copie fraîche, jamais de mutation en place ---

  StoredFileStore insertStoredFile(Id<dynamic> ownerId, StoredFileFields file) {
    final index = ownerIndex.copy()..addRelationship(ownerId, file.id);
    return copyWith(
      storedFileStore: storedFileStore.insertState(file),
      ownerIndex: index,
    );
  }

  StoredFileStore removeMedia(StoredFileId id) {
    final index = ownerIndex.copy()..removeOwned(id);
    return copyWith(
      storedFileStore: storedFileStore.remove(id),
      ownerIndex: index,
    );
  }

  StoredFileStore clear() => StoredFileStore.initial();

  // --- Actions qui ne touchent pas l'index : on le réutilise tel quel (pas de copie) ---

  StoredFileStore rollbackMedia(StoredFileId id) =>
      copyWith(storedFileStore: storedFileStore.rollbackNode(id));

  StoredFileStore setNode(StoredFileFields value) =>
      copyWith(storedFileStore: storedFileStore.setNode(value));

  StoredFileStore updateNode(
    StoredFileId id,
    GraphNode<StoredFileFields> Function(GraphNode<StoredFileFields> node)
    update,
  ) => copyWith(storedFileStore: storedFileStore.updateNode(id, update));
}

extension StoredFileStoreGetters on StoredFileStore {
  List<StoredFileId> getFromOwner(Id<dynamic> ownerId) =>
      ownerIndex.owneds(ownerId).toList();

  GraphNode<StoredFileFields>? get(StoredFileId id) => storedFileStore.get(id);
}
