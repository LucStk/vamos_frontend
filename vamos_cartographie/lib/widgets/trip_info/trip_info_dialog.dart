import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection.dart';

import 'package:vamos_cartographie/domain/domain.dart';

import 'package:vamos_cartographie/data/repositories/i_trip_repository.dart';
import 'trip_info_view.dart';
import 'editor/trip_info_editor.dart';
import "../shared/dialog_shell.dart";

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
          builder: (ctx) => DialogShell(
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
      builder: (ctx) => DialogShell(
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
      builder: (ctx) => DialogShell(
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
