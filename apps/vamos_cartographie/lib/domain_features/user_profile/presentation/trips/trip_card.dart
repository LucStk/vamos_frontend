import 'package:flutter/material.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.tripSummary, required this.onTap});

  final TripSummary tripSummary;
  final VoidCallback onTap;

  /// Première image sans erreur, remote ou patch. null → placeholder.
  StoredFileFields? get _cover =>
      tripSummary.storedFiles.where((f) => !f.hasError).firstOrNull;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trip = tripSummary.trip;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: InkWell(
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
