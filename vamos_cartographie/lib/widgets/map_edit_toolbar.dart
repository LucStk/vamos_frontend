import 'package:flutter/material.dart';

/// Barre d'outils d'édition affichée en bas de la carte.
/// Visible uniquement en mode édition.
class MapEditToolbar extends StatelessWidget {
  final bool isAddingPoint;
  final VoidCallback onToggleAddPoint;
  final VoidCallback onSave;
  final VoidCallback onReload;

  const MapEditToolbar({
    super.key,
    required this.isAddingPoint,
    required this.onToggleAddPoint,
    required this.onSave,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withOpacity(0.95),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Toggle ajout de point
              _ToolbarButton(
                icon: isAddingPoint
                    ? Icons.location_off
                    : Icons.add_location_alt,
                label: isAddingPoint ? 'Stop' : 'Ajouter',
                color: isAddingPoint
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.primary,
                onPressed: onToggleAddPoint,
              ),

              Container(
                width: 1,
                height: 32,
                color: theme.colorScheme.outlineVariant,
              ),

              // Sauvegarder
              _ToolbarButton(
                icon: Icons.save_outlined,
                label: 'Sauvegarder',
                color: theme.colorScheme.primary,
                onPressed: onSave,
              ),

              Container(
                width: 1,
                height: 32,
                color: theme.colorScheme.outlineVariant,
              ),

              // Recharger
              _ToolbarButton(
                icon: Icons.refresh,
                label: 'Recharger',
                color: theme.colorScheme.onSurfaceVariant,
                onPressed: onReload,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
