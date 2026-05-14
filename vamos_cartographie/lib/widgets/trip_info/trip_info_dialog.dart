import 'package:flutter/material.dart';
import '../../core/injection.dart';
import '../../models.dart';
import '../../repository/trip_repository.dart';
import 'trip_info_view.dart';
import 'trip_info_editor.dart';

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
    required String tripId,
    required VoidCallback onSaved,
  }) async {
    // Charge le Trip complet
    final result = await getIt<TripRepository>().getTrip(tripId);
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
          builder: (ctx) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Modifier le voyage',
                      textAlign: TextAlign.center,
                      style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Divider(color: Theme.of(ctx).colorScheme.outlineVariant),
                    const SizedBox(height: 12),
                    TripInfoEditor(
                      trip: trip,
                      onConfirm: () async {
                        final saveResult = await getIt<TripRepository>()
                            .updateTrip(trip);
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void _showView({required BuildContext context, required Trip trip}) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480, maxHeight: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Titre du dialog
                Text(
                  'Informations du voyage',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    ctx,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Divider(color: Theme.of(ctx).colorScheme.outlineVariant),
                const SizedBox(height: 12),

                // Contenu
                TripInfoView(trip: trip),
                const SizedBox(height: 16),

                // Bouton Fermer
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Fermer'),
                  ),
                ),
              ],
            ),
          ),
        ),
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
      barrierDismissible: false, // force le choix Confirmer/Annuler
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Titre du dialog
                Text(
                  'Informations du voyage',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    ctx,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Divider(color: Theme.of(ctx).colorScheme.outlineVariant),
                const SizedBox(height: 12),

                // Éditeur
                TripInfoEditor(
                  trip: trip,
                  onConfirm: () {
                    onChanged();
                    Navigator.of(ctx).pop();
                  },
                  onCancel: () => Navigator.of(ctx).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
