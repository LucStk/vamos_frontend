import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:stored_file_application/stored_file_application.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.trip,
    required this.images,
    required this.onTap,
  });

  final Trip trip;
  final List<StoredFileRemoteModel> images;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coverUrl = images.isEmpty ? null : images.first.url;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 5 / 3,
              child: coverUrl == null
                  ? const _TripPlaceholder()
                  : Image.network(
                      coverUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const _TripPlaceholder(),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.title.isEmpty ? 'Voyage sans titre' : trip.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trip.description.isEmpty
                        ? 'Aucune description'
                        : trip.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  if (trip.date != null) ...[
                    const SizedBox(height: 8),
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
