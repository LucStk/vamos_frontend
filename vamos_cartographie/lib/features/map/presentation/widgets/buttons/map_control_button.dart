import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapControlButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const MapControlButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: tooltip,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        color: theme.colorScheme.surface.withOpacity(0.95),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: SizedBox(
            width: 36,
            height: 36,
            child: Icon(icon, size: 20, color: theme.colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
