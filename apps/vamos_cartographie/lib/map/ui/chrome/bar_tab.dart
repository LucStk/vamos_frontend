import 'package:flutter/material.dart';

class BarTab extends StatelessWidget {
  const BarTab({
    super.key,
    required this.icon,
    this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = selected ? scheme.primary : scheme.onSurfaceVariant;
    final shown = selected ? (selectedIcon ?? icon) : icon;

    return Tooltip(
      message: label,
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        excludeSemantics: true,
        child: InkResponse(
          onTap: onTap,
          radius: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  shown,
                  key: ValueKey(selected),
                  size: 22,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              // Petit trait sous l'onglet actif.
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                width: selected ? 16 : 0,
                height: 3,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
