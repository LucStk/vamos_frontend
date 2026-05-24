import "package:flutter/material.dart";

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CancelButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      // style: FilledButton.styleFrom(backgroundColor: Colors.red),
      // icon: const Icon(Icons.delete_outline, size: 16),
      label: const Text('Annuler'),
    );
  }
}
