import 'package:material_ui/material_ui.dart';

/// Demande le titre du voyage qu'on s'apprête à créer.
///
/// Retourne le titre saisi, une chaîne vide si l'utilisateur passe cette
/// étape, ou null s'il referme le dialog (la création n'a pas lieu).
Future<String?> showTripTitleDialog(BuildContext context) => showDialog<String>(
  context: context,
  builder: (_) => const _TripTitleDialog(),
);

class _TripTitleDialog extends StatefulWidget {
  const _TripTitleDialog();

  @override
  State<_TripTitleDialog> createState() => _TripTitleDialogState();
}

class _TripTitleDialogState extends State<_TripTitleDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() => Navigator.of(context).pop(_controller.text.trim());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nouveau voyage'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _submit(),
        decoration: const InputDecoration(labelText: 'Titre du voyage'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(''),
          child: const Text('Passer'),
        ),
        FilledButton(onPressed: _submit, child: const Text('Créer')),
      ],
    );
  }
}
