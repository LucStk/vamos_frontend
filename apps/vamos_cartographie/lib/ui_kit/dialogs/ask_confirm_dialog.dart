import 'package:flutter/material.dart';

/// Boîte de dialogue de confirmation pour la suppression d'un voyage.
/// Retourne `true` si l'utilisateur confirme, sinon `false` (ou `null`).
class AskConfirmDialog extends StatelessWidget {
  final String message;
  const AskConfirmDialog({super.key, required this.message});

  /// Raccourci statique pour afficher la boîte de dialogue proprement
  static Future<bool?> show(BuildContext context, String? message) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AskConfirmDialog(
        message: message ?? "Êtes vous sûr de vouloir effectuer cette action",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Évite d'avoir un titre vide affiché bizarrement dans la dialog

    return AlertDialog(
      title: const Text('Attention'),
      content: Text(message),
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
          child: const Text('Confirmer'),
        ),
      ],
    );
  }
}
