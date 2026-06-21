import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class TripCardContent extends StatelessWidget {
  final Trip trip;
  const TripCardContent({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final title = trip.title.trim().isEmpty ? 'Sans titre' : trip.title.trim();
    final hasDate = trip.date != null;
    final dateStr = trip.date?.toIso8601String().substring(0, 10);
    final hasDescription = trip.description.trim().isNotEmpty;

    // TODO: implement build
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (hasDate) ...[
            const SizedBox(height: 2),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  dateStr!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
          if (hasDescription) ...[
            const SizedBox(height: 4),
            Text(
              trip.description.trim(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
