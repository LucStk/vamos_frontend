import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/stored_file/stored_file.dart';
import '/trip/presentation/widgets/trip_section_label.dart';
import 'package:vamos_cartographie/trip/trip.dart';

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

    await ref.read(tripStoreProvider.notifier).deleteTrip(tripId);

    if (!context.mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Voyage supprimé avec succès')),
    );
  }

  void _openEditor(BuildContext context, Trip trip) {
    Navigator.of(context).pop(); // ferme le viewer, comme avant
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => TripFormDialog(
        initialTrip: trip,
        successMessage: 'Voyage mis à jour',
      ),
    );
  }

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

    return DialogShell(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
          if (hasDate) ...[
            DateDisplay(date: trip.date!),
            const SizedBox(height: 12),
          ],
          if (hasDesc) ...[
            const TripSectionLabel(label: 'DESCRIPTION', icon: Icons.notes),
            const SizedBox(height: 6),
            Text(trip.description.trim(), style: theme.textTheme.bodyMedium),
            const SizedBox(height: 16),
          ],
          const TripSectionLabel(
            label: 'PHOTOS',
            icon: Icons.photo_library_outlined,
          ),
          const SizedBox(height: 8),
          ImageCarouselView(id: tripId),
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
      buttonsBuilder: (ctx) => [
        ModifierButton(onPressed: () => _openEditor(context, trip)),
        const SizedBox(width: 8),
        ExploreButton(
          onPressed: () {
            Navigator.of(context).pop();
            onExplore();
          },
        ),
        const SizedBox(width: 8),
        DeleteButton(
          onPressed: () async {
            await _deleteTrip(context, ref);
          },
        ),
      ],
    );
  }
}
