import 'package:flutter/material.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.tripSummary,
    required this.onTap,
    this.onDelete,
  });

  final TripSummary tripSummary;
  final VoidCallback onTap;

  /// null → pas de menu (ex. voyage d'un autre utilisateur).
  final VoidCallback? onDelete;

  /// Première image sans erreur, remote ou patch. null → placeholder.
  StoredFileFields? get _cover =>
      tripSummary.storedFiles.where((f) => !f.hasError).firstOrNull;

  Future<void> _confirmDelete(BuildContext context) async {
    final title = tripSummary.trip.title.isEmpty
        ? 'ce voyage'
        : '« ${tripSummary.trip.title} »';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Supprimer $title ?'),
        content: const Text(
          'Le tracé, la description et les photos seront perdus.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirmed == true) onDelete?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trip = tripSummary.trip;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _TripCover(cover: _cover)),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        trip.title.isEmpty ? 'Voyage sans titre' : trip.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        trip.description.isEmpty
                            ? 'Aucune description'
                            : trip.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                      if (trip.date != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          MaterialLocalizations.of(
                            context,
                          ).formatMediumDate(trip.date!),
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (onDelete != null)
            Positioned(
              top: 4,
              right: 4,
              child: _TripCardMenu(onDelete: () => _confirmDelete(context)),
            ),
        ],
      ),
    );
  }
}

/// Menu « ... » posé sur la couverture : fond sombre translucide pour rester
/// lisible quelle que soit la photo.
class _TripCardMenu extends StatelessWidget {
  const _TripCardMenu({required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final error = Theme.of(context).colorScheme.error;

    return Material(
      color: Colors.black38,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: PopupMenuButton<void>(
        icon: const Icon(Icons.more_horiz, size: 20, color: Colors.white),
        tooltip: 'Options du voyage',
        padding: EdgeInsets.zero,
        iconSize: 20,
        itemBuilder: (context) => [
          PopupMenuItem<void>(
            onTap: onDelete,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.delete_outline, color: error),
              title: Text('Supprimer', style: TextStyle(color: error)),
            ),
          ),
        ],
      ),
    );
  }
}

class _TripCover extends StatelessWidget {
  const _TripCover({required this.cover});

  final StoredFileFields? cover;

  @override
  Widget build(BuildContext context) {
    // switch exhaustif sur la sealed class : un nouveau sous-type
    // casserait la compilation ici plutôt que de passer inaperçu.
    return switch (cover) {
      null => const _TripPlaceholder(),

      StoredFileRemoteModel(:final url) => Image.network(
        url,
        fit: BoxFit.cover,
        cacheWidth: 400,
        errorBuilder: (_, _, _) => const _TripPlaceholder(),
      ),

      StoredFilePatchModel(
        file: final localFile,
        :final status,
        :final sent,
        :final total,
      ) =>
        Stack(
          fit: StackFit.expand,
          children: [
            Image.file(
              localFile,
              fit: BoxFit.cover,
              cacheWidth: 400,
              errorBuilder: (_, _, _) => const _TripPlaceholder(),
            ),
            if (status == UploadStatus.uploading)
              Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  value: total > 0 ? sent / total : null,
                ),
              ),
          ],
        ),
    };
  }
}

class _TripPlaceholder extends StatelessWidget {
  const _TripPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(child: Icon(Icons.map_outlined, size: 40)),
    );
  }
}
