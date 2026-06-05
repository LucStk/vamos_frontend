import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/shared/shared.dart';
import "package:vamos_cartographie/features/trips/application/providers/trips_providers.dart";
import "trip_editor_dialog.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import 'package:vamos_cartographie/shared/widgets/widgets.dart';

import "package:vamos_cartographie/features/trips/presentation/widgets/widgets.dart";

class TripViewerDialog extends ConsumerWidget {
  final Trip tripData;
  final VoidCallback onExplore;

  const TripViewerDialog({
    super.key,
    required this.tripData,
    required this.onExplore,
  });

  static void show({
    required BuildContext context,
    required Trip tripData,
    required VoidCallback onExplore,
  }) {
    showDialog(
      context: context,
      builder: (_) =>
          TripViewerDialog(tripData: tripData, onExplore: onExplore),
    );
  }

  Future<void> _deleteTrip(
    BuildContext context,
    WidgetRef ref,
    Trip trip,
  ) async {
    // On appelle la méthode statique qu'on a créée au-dessus
    final confirmed = await AskConfirmDialog.show(
      context,
      "Voulez vous vraiment supprimer ce voyage ? Cette action est irréversible.",
    );

    // Si l'utilisateur a annulé ou cliqué à côté de la boîte de dialogue
    if (confirmed != true) return;

    try {
      // Appel à Riverpod pour supprimer dans le state / serveur
      await ref.read(tripsProvider.notifier).deleteTrip(trip.id);

      // Sécurité Flutter obligatoire après un "await"
      if (!context.mounted) return;

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Voyage supprimé avec succès')),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la suppression : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(tripsProvider);

    return tripsAsync.when(
      loading: () => const DialogLoadingBody(),

      error: (error, _) {
        return DialogErrorBody(errorMessage: error.toString());
      },

      data: (trips) {
        final trip = trips.where((t) => t.id == tripData.id).firstOrNull;

        if (trip == null) {
          return const SizedBox.shrink();
        }

        return DialogShell(
          content: TripInfoView(trip: trip),

          buttonsBuilder: (ctx) => [
            DeleteButton(
              onPressed: () async {
                await _deleteTrip(context, ref, tripData);
              },
            ),

            const SizedBox(width: 8),
            ModifierButton(
              onPressed: () async {
                Navigator.of(context).pop();

                await Future.delayed(Duration.zero);

                if (!context.mounted) return;

                TripEditorDialog.show(context: context, tripId: trip.id);
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
      },
    );
  }
}
