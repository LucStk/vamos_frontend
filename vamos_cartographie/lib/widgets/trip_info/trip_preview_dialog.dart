import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import '../../models.dart';
import 'trip_info_view.dart';

/// Dialog de prévisualisation d'un voyage depuis l'ExplorerPage.
/// Affiche les infos en lecture avec 3 actions : Retour, Modifier, Explorer.
class TripPreviewDialog extends StatelessWidget {
  final GTripFieldsData tripData;
  final VoidCallback onEdit;
  final VoidCallback onExplore;

  const TripPreviewDialog({
    super.key,
    required this.tripData,
    required this.onEdit,
    required this.onExplore,
  });

  /// Affiche le dialog de prévisualisation.
  static void show({
    required BuildContext context,
    required GTripFieldsData tripData,
    required VoidCallback onEdit,
    required VoidCallback onExplore,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => TripPreviewDialog(
        tripData: tripData,
        onEdit: onEdit,
        onExplore: onExplore,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Construit un Trip minimal pour TripInfoView
    final trip = Trip(
      id: tripData.id,
      title: tripData.title,
      description: tripData.description,
      date: tripData.date != null ? DateTime.tryParse(tripData.date!) : null,
      imagePaths: [],
    );

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 600),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── En-tête ──
              Text(
                'Aperçu du voyage',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Divider(color: theme.colorScheme.outlineVariant),
              const SizedBox(height: 12),

              // ── Contenu ──
              TripInfoView(trip: trip),
              const SizedBox(height: 20),

              // ── Boutons ──
              Row(
                children: [
                  // Retour
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Retour'),
                  ),
                  const Spacer(),
                  // Modifier
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onEdit();
                    },
                    icon: const Icon(Icons.edit_outlined, size: 16),
                    label: const Text('Modifier'),
                  ),
                  const SizedBox(width: 8),
                  // Explorer
                  FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onExplore();
                    },
                    icon: const Icon(Icons.map_outlined, size: 16),
                    label: const Text('Explorer'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
