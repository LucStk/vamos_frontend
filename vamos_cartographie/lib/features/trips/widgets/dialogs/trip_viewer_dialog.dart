import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/trip_handler.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/trip_domain_queries.dart';
import 'package:vamos_cartographie/features/carousel/carousel.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/features/trips/widgets/trip_section_label.dart';
import "trip_editor_dialog.dart";

class TripViewerDialog extends ConsumerWidget {
  final Id<Trip> tripId;
  final VoidCallback onExplore;

  const TripViewerDialog({
    super.key,
    required this.tripId,
    required this.onExplore,
  });

  static void show({
    required BuildContext context,
    required Id<Trip> tripId,
    required VoidCallback onExplore,
  }) {
    showDialog(
      context: context,
      builder: (_) => TripViewerDialog(tripId: tripId, onExplore: onExplore),
    );
  }

  Future<void> _deleteTrip(BuildContext context, WidgetRef ref) async {
    final confirmed = await AskConfirmDialog.show(
      context,
      "Voulez vous vraiment supprimer ce voyage ? Cette action est irréversible.",
    );
    if (confirmed != true) return;

    // Plus de try-catch local !
    // Si deleteTrip crash, le gestionnaire global l'attrapera.
    await ref.read(tripHandlerProvider).deleteTrip(tripId);

    if (!context.mounted) return;
    // On ne gère ICI que le comportement en cas de succès
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Voyage supprimé avec succès')),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Récupération directe du voyage via le provider hérité de TripInfoView
    final trip = ref.watch(tripProvider(tripId));

    // Gestion de l'état où le voyage n'existe pas ou est en cours de suppression
    if (trip == null) {
      return const SizedBox.shrink();
    }

    final hasTitle = trip.title.trim().isNotEmpty;
    final hasDesc = trip.description.trim().isNotEmpty;
    final hasDate = trip.date != null;

    return DialogShell(
      // 1. Le Contenu textuel et visuel (anciennement TripInfoView)
      content: Column(
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
          const TripSectionLabel(
            label: 'PHOTOS',
            icon: Icons.photo_library_outlined,
          ),
          const SizedBox(height: 8),
          ImageCarouselView(id: tripId),

          // État vide (Uniquement si pas de description)
          if (!hasDesc)
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
      ),

      // 2. Les Boutons d'actions du footer de la modale
      buttonsBuilder: (ctx) => [
        DeleteButton(
          onPressed: () async {
            await _deleteTrip(context, ref);
          },
        ),
        const SizedBox(width: 8),
        ModifierButton(
          onPressed: () async {
            // Sécurité pour s'assurer que le dialogue parent est stable avant d'ouvrir le suivant
            await Future.delayed(Duration.zero);
            if (!context.mounted) return;
            TripEditorDialog.show(context: context, tripId: tripId);
          },
        ),
        const SizedBox(width: 8),
        ExploreButton(
          onPressed: () {
            Navigator.of(context).pop();
            onExplore();
          },
        ),
      ],
    );
  }
}
