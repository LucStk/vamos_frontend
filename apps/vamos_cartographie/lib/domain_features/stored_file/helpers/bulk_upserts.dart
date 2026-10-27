import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/application/stored_file_store.dart';
import 'package:stored_file_application/domain/stored_file_model.dart';
import 'package:trip_application/trip_application.dart';

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
  StoredFileStore upsertRemoteFiles(Iterable<TripSummary> trips) {
    var nodes = storedFileStore;

    for (final summary in trips) {
      final known = getFromOwner(summary.trip.id).toSet();
      final incoming = <StoredFileId>{};

      for (final file in summary.storedFiles) {
        incoming.add(file.id);
        nodes = nodes.get(file.id) == null
            ? nodes.insertState(file)
            : nodes.setNode(file);
        if (!known.contains(file.id)) {
          ownerIndex.addRelationship(summary.trip.id, file.id);
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
