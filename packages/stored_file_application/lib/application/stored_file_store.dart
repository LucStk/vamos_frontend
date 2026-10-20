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

  StoredFileStore rollbackMedia(StoredFileId wid) {
    return copyWith(storedFileStore: storedFileStore.rollbackNode(wid));
  }

  StoredFileStore setNode(StoredFileFields value) {
    return copyWith(storedFileStore: storedFileStore.setNode(value));
  }

  StoredFileStore updateNode(
    StoredFileId id,
    GraphNode<StoredFileFields> Function(GraphNode<StoredFileFields> node)
    update,
  ) {
    return copyWith(storedFileStore: storedFileStore.updateNode(id, update));
  }

  StoredFileStore clear() {
    ownerIndex.clear();
    return copyWith(storedFileStore: GraphCollectionStore<StoredFileFields>());
  }
}

extension StoredFileStoreGetters on StoredFileStore {
  List<StoredFileId> getFromOwner(Id mId) {
    return ownerIndex.owneds(mId)?.toList() ?? [];
  }

  GraphNode<StoredFileFields>? get(StoredFileId id) {
    return storedFileStore.get(id);
  }
}

extension StoredFileStoreBulk on StoredFileStore {
  /// Insère plusieurs fichiers d'un même propriétaire en une seule passe
  /// (une seule copie du store à la fin).
  StoredFileStore insertStoredFiles(
    Id ownerId,
    Iterable<StoredFileFields> files,
  ) {
    var nodes = storedFileStore;
    for (final file in files) {
      ownerIndex.addRelationship(ownerId, file.id);
      nodes = nodes.insertState(file);
    }
    return copyWith(storedFileStore: nodes);
  }

  /// Fusionne l'état serveur de plusieurs propriétaires dans le store existant.
  /// Pour chaque propriétaire listé (même avec zéro fichier) :
  /// - les fichiers connus sont mis à jour, les nouveaux sont insérés ;
  /// - ceux qui ne sont plus côté serveur sont retirés, SAUF les créations
  ///   locales en attente (upload en cours).
  /// Les propriétaires non listés ne sont pas touchés.
  StoredFileStore upsertRemoteFiles(
    Iterable<(Id, Iterable<StoredFileFields>)> filesByOwner,
  ) {
    var nodes = storedFileStore;

    for (final (owner, files) in filesByOwner) {
      final known = getFromOwner(owner).toSet();
      final incoming = <StoredFileId>{};

      for (final file in files) {
        incoming.add(file.id);
        nodes = nodes.get(file.id) == null
            ? nodes.insertState(file)
            : nodes.setNode(file);
        if (!known.contains(file.id)) {
          ownerIndex.addRelationship(owner, file.id);
        }
      }

      for (final staleId in known.difference(incoming)) {
        final node = nodes.get(staleId);
        if (node != null && node.isPendingCreation) continue; // upload en cours
        ownerIndex.removeOwned(staleId);
        nodes = nodes.remove(staleId);
      }
    }
    return copyWith(storedFileStore: nodes);
  }
}
