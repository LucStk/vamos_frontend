import 'package:material_ui/material_ui.dart';

class ModifierButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ModifierButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.edit_outlined, size: 16),
      label: const Text('Modifier'),
    );
  }
}
