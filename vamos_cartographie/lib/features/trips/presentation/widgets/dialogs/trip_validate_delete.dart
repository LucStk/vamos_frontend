import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';

/// Boîte de dialogue de confirmation pour la suppression d'un voyage.
/// Retourne `true` si l'utilisateur confirme, sinon `false` (ou `null`).
class TripValidateDeleteDialog extends StatelessWidget {
  const TripValidateDeleteDialog({
    super.key,
    required this.tripTitle, // On exige le voyage à supprimer
  });

  final String? tripTitle;

  /// Raccourci statique pour afficher la boîte de dialogue proprement
  static Future<bool?> show(BuildContext context, String tripTitle) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => TripValidateDeleteDialog(tripTitle: tripTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Évite d'avoir un titre vide affiché bizarrement dans la dialog
    final displayTitle = tripTitle != null ? 'Sans titre' : tripTitle;

    return AlertDialog(
      title: const Text('Supprimer le voyage'),
      content: Text('Voulez-vous vraiment supprimer « $displayTitle » ?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Annuler'),
        ),
        FilledButton(
          // Tu peux changer la couleur en rouge si tu veux accentuer la suppression
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Supprimer'),
        ),
      ],
    );
  }
}
