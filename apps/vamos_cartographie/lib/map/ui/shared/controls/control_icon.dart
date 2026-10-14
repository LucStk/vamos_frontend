import 'package:flutter/material.dart';

class ControlIcon extends StatelessWidget {
  final IconData icon;

  const ControlIcon({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Icon(icon, size: 20, color: theme.colorScheme.onSurface);
  }
}
