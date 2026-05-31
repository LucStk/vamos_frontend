import 'package:flutter/material.dart';

class HandleBackDialog extends StatelessWidget {
  final VoidCallback onIgnore;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const HandleBackDialog({
    super.key,
    required this.onCancel,
    required this.onIgnore,
    required this.onSave,
  });

  static void show({
    required BuildContext context,
    required VoidCallback onIgnore,
    required VoidCallback onCancel,
    required VoidCallback onSave,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => HandleBackDialog(
        onCancel: onCancel,
        onIgnore: onIgnore,
        onSave: onSave,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. On crée une fonction locale qui centralise la logique de fermeture
    void closeAndExecute(VoidCallback action) {
      Navigator.pop(context);
      action();
    }

    return AlertDialog(
      title: const Text('Modifications non enregistrées'),
      content: const Text('Voulez-vous sauvegarder avant de quitter ?'),
      actions: [
        // 2. On passe simplement une fonction fléchée qui appelle notre utilitaire
        TextButton(
          onPressed: () => closeAndExecute(onIgnore),
          child: const Text('Ignorer'),
        ),
        TextButton(
          onPressed: () => closeAndExecute(onCancel),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () => closeAndExecute(onSave),
          child: const Text('Sauvegarder'),
        ),
      ],
    );
  }
}
