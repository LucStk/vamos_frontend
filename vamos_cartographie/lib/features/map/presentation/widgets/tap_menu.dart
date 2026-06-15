import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback onClose;

  const MenuCard({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(12),
      color: theme.colorScheme.surface,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 220),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 4, 4),
              child: Row(
                children: [
                  // Expanded(
                  //   child: Text(
                  //     '${_format(position.latitude)}, ${_format(position.longitude)}',
                  //     style: theme.textTheme.labelSmall?.copyWith(
                  //       color: theme.colorScheme.onSurfaceVariant,
                  //     ),
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close),
                    iconSize: 18,
                    visualDensity: VisualDensity.compact,
                    splashRadius: 18,
                    tooltip: 'Fermer',
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: theme.colorScheme.outlineVariant),
          ],
        ),
      ),
    );
  }

  // String _format(double value) => value.toStringAsFixed(5);
}
