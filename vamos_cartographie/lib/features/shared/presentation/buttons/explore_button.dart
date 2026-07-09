import 'package:flutter/material.dart';

class ExploreButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ExploreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.map_outlined, size: 16),
      label: const Text('Explorer'),
    );
  }
}
