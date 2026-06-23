import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/commands_provider.dart/trip_provider.dart';
import 'package:vamos_cartographie/core/injection/queries/trip_queries.dart';
import 'package:vamos_cartographie/core/injection/trip_store.dart';
import 'package:vamos_cartographie/features/carousel/carousel.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'trip_section_label.dart';

/// Vue lecture seule des informations d'un voyage.
/// Utilisée dans le dialog d'affichage.
class TripInfoView extends ConsumerWidget {
  final Id<Trip> tripId;
  final VoidCallback? onEdit;

  const TripInfoView({super.key, required this.tripId, this.onEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final trip = ref.watch(tripProvider(tripId));
    if (trip == null) {
      return const SizedBox.shrink();
    }
    final hasTitle = trip.title.trim().isNotEmpty;
    final hasDesc = trip.description.trim().isNotEmpty;
    final hasDate = trip.date != null;

    final images = ref.watch(tripImagesProvider(tripId));

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
          DateDisplay(date: trip.date!),
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
          ImageCarouselView(images: images),
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
