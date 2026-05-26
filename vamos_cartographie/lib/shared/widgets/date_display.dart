import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatelessWidget {
  final DateTime date;

  const DateDisplay({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize:
          MainAxisSize.min, // Évite que le Row ne prenne toute la largeur
      children: [
        Icon(Icons.calendar_today, size: 15, color: theme.colorScheme.primary),
        const SizedBox(width: 6),
        Text(
          DateFormat('dd MMMM yyyy', 'fr_FR').format(date),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
