import 'package:flutter/material.dart';
import "package:vamos_cartographie/core/core.dart";
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import "package:vamos_cartographie/features/trips/application/providers/trips_notifier.dart";
import "trip_editor_dialog.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:vamos_cartographie/features/trips/presentation/widgets/widgets.dart";

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
    // On appelle la méthode statique qu'on a créée au-dessus
    final confirmed = await AskConfirmDialog.show(
      context,
      "Voulez vous vraiment supprimer ce voyage ? Cette action est irréversible.",
    );
    if (confirmed != true) return;
    try {
      // Appel à Riverpod pour supprimer dans le state / serveur
      await ref.read(tripsProvider.notifier).deleteTrip(tripId);
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
    return DialogShell(
      content: TripInfoView(tripId: tripId),

      buttonsBuilder: (ctx) => [
        DeleteButton(
          onPressed: () async {
            await _deleteTrip(context, ref);
          },
        ),

        const SizedBox(width: 8),

        ModifierButton(
          onPressed: () async {
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
