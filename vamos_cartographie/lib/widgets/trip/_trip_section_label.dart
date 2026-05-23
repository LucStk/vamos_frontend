import 'package:flutter/material.dart';

class TripSectionLabel extends StatelessWidget {
  final String label;
  final IconData? icon;

  const TripSectionLabel({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 14, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
        ],
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.primary,
            letterSpacing: 0.6,
          ),
        ),
      ],
    );
  }
}
