import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final DateTime? date;
  final ValueChanged<DateTime?> onDateChanged;

  const DatePicker({
    super.key,
    required this.date,
    required this.onDateChanged,
  });

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('fr', 'FR'),
    );

    // Si l'utilisateur choisit une date, on la renvoie au parent
    if (picked != null) {
      onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Bouton de sélection
        OutlinedButton.icon(
          icon: const Icon(Icons.calendar_today, size: 16),
          label: Text(
            date != null
                ? DateFormat('dd MMM yyyy', 'fr_FR').format(date!)
                : 'Choisir une date',
            style: TextStyle(
              color: date != null
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          onPressed: () => _pickDate(context),
        ),

        // Bouton de suppression (si une date existe)
        if (date != null) ...[
          const SizedBox(width: 8),
          IconButton.outlined(
            icon: const Icon(Icons.clear, size: 18),
            tooltip: 'Effacer la date',
            // On renvoie "null" pour signifier la suppression
            onPressed: () => onDateChanged(null),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(6),
              minimumSize: const Size(32, 32),
            ),
          ),
        ],
      ],
    );
  }
}
