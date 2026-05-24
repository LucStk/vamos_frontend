import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DeleteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_outline, size: 16),
      label: const Text('Delete'),
    );
  }
}
