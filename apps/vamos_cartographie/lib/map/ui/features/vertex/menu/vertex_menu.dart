import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/context_menu_shell.dart';

class VertexMenuWidget extends StatelessWidget {
  const VertexMenuWidget({
    super.key,
    required this.drawFrom,
    required this.createFrom,
    required this.delete,
    required this.move,
  });

  final VoidCallback drawFrom;
  final VoidCallback createFrom;
  final VoidCallback delete;
  final VoidCallback move;

  @override
  Widget build(BuildContext context) {
    return ContextMenuShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _MenuButton(
            icon: Icons.route,
            label: 'Tracer depuis',
            onPressed: drawFrom,
          ),
          _MenuButton(
            icon: Icons.add_location_alt_outlined,
            label: 'Créer',
            onPressed: createFrom,
          ),
          _MenuButton(
            icon: Icons.delete_outline,
            label: 'Effacer',
            onPressed: delete,
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.foregroundColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
