import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection.dart';

import 'package:vamos_cartographie/domain/domain.dart';

import 'package:vamos_cartographie/data/repositories/i_trip_repository.dart';
import 'trip_info_view.dart';
import 'editor/trip_info_editor.dart';

// ── Shell partagée ────────────────────────────────────────────────────────────

/// Enveloppe Dialog commune : titre centré, divider, contenu scrollable,
/// puis une rangée de boutons en bas.
///
/// Utilisée par [TripInfoDialog] et [TripPreviewDialog].
class TripInfoDialogShell extends StatelessWidget {
  final Widget content;
  final List<Widget> actions;
  final BoxConstraints constraints;

  const TripInfoDialogShell({
    super.key,
    required this.content,
    required this.actions,
    this.constraints = const BoxConstraints(maxWidth: 480, maxHeight: 600),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: constraints,
        child: Stack(
          children: [
            // 1. Le contenu principal qui peut défiler
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 24,
                  ), // Un peu plus d'espace en haut pour ne pas chevaucher la croix
                  // ── Contenu ──
                  content,
                  const SizedBox(height: 20),

                  // ── Boutons ──
                  Row(children: actions),
                ],
              ),
            ),

            // 2. Le bouton de fermeture positionné en haut à droite
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
                // Optionnel : ajoute un léger effet visuel au survol si nécessaire
                splashRadius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
} // ── TripInfoDialog ────────────────────────────────────────────────────────────

/// Affiche les informations du voyage dans un dialog centré (Card).
/// [readOnly] détermine si on affiche la vue lecture ou la vue édition.
class TripInfoDialog {
  static void show({
    required BuildContext context,
    required Trip trip,
    required VoidCallback onChanged,
    bool readOnly = false,
  }) {
    if (readOnly) {
      _showView(context: context, trip: trip);
    } else {
      _showEditor(context: context, trip: trip, onChanged: onChanged);
    }
  }

  /// Ouvre l'éditeur pour un voyage existant (depuis l'ExplorerPage).
  /// Charge le Trip complet, puis sauvegarde via updateTrip() à la confirmation.
  static Future<void> showEditorForExistingTrip({
    required BuildContext context,
    required int tripId,
    required VoidCallback onSaved,
  }) async {
    final result = await getIt<ITripRepository>().getTrip(tripId);
    if (!context.mounted) return;

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur : ${failure.message}'),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      (trip) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => TripInfoDialogShell(
            constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
            content: TripInfoEditor(
              trip: trip,
              onConfirm: () async {
                final saveResult = await getIt<ITripRepository>().updateTrip(
                  trip.id!,
                  trip,
                );
                if (!ctx.mounted) return;
                saveResult.fold(
                  (failure) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      SnackBar(
                        content: Text('Erreur : ${failure.message}'),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  (_) {
                    Navigator.of(ctx).pop();
                    onSaved();
                  },
                );
              },
              onCancel: () => Navigator.of(ctx).pop(),
            ),
            // Les boutons sont gérés directement par TripInfoEditor.
            actions: const [],
          ),
        );
      },
    );
  }

  static void _showView({required BuildContext context, required Trip trip}) {
    showDialog(
      context: context,
      builder: (ctx) => TripInfoDialogShell(
        content: TripInfoView(trip: trip),
        actions: [
          const Spacer(),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  static void _showEditor({
    required BuildContext context,
    required Trip trip,
    required VoidCallback onChanged,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => TripInfoDialogShell(
        constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
        content: TripInfoEditor(
          trip: trip,
          onConfirm: () {
            onChanged();
            Navigator.of(ctx).pop();
          },
          onCancel: () => Navigator.of(ctx).pop(),
        ),
        actions: const [],
      ),
    );
  }
}
