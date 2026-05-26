import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/shared/widgets/widgets.dart';
import '../trip_section_label.dart';

/// Vue lecture seule des informations d'un voyage.
/// Utilisée dans le dialog d'affichage.
class TripInfoView extends StatelessWidget {
  final Trip trip;
  final VoidCallback? onEdit;

  const TripInfoView({super.key, required this.trip, this.onEdit});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasTitle = trip.title.trim().isNotEmpty;
    final hasDesc = trip.description.trim().isNotEmpty;
    final hasDate = trip.date != null;
    final hasPhotos = trip.images.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Titre
        Text(
          hasTitle ? trip.title.trim() : 'Sans titre',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: hasTitle
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurface.withOpacity(0.35),
          ),
        ),
        const SizedBox(height: 12),

        // Date
        if (hasDate) ...[
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 15,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                DateFormat('dd MMMM yyyy', 'fr_FR').format(trip.date!),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],

        // Description
        if (hasDesc) ...[
          const TripSectionLabel(label: 'DESCRIPTION', icon: Icons.notes),
          const SizedBox(height: 6),
          Text(trip.description.trim(), style: theme.textTheme.bodyMedium),
          const SizedBox(height: 16),
        ],

        // Photos
        if (hasPhotos) ...[
          const TripSectionLabel(
            label: 'PHOTOS',
            icon: Icons.photo_library_outlined,
          ),
          const SizedBox(height: 8),
          ImageCarouselPicker(
            remoteImages: trip.images,
            readOnly: true,
            onChanged: (_) {},
          ),
        ],

        // État vide
        if (!hasDesc && !hasPhotos)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Aucune information renseignée.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.4),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
