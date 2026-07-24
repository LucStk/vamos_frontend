import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DeleteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onPressed,
      style: FilledButton.styleFrom(backgroundColor: Colors.red),
      icon: const Icon(Icons.delete_outline, size: 16),
      color: Colors.white,
    );
  }
}
