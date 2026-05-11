import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// Boutons de contrôle de la carte : zoom +/- et remise au nord.
class MapControls extends StatelessWidget {
  final MapController mapController;

  const MapControls({super.key, required this.mapController});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          _MapControlButton(
            icon: Icons.add,
            tooltip: 'Zoom avant',
            onPressed: () => mapController.move(
              mapController.camera.center,
              mapController.camera.zoom + 1,
            ),
          ),
          const SizedBox(height: 6),
          _MapControlButton(
            icon: Icons.remove,
            tooltip: 'Zoom arrière',
            onPressed: () => mapController.move(
              mapController.camera.center,
              mapController.camera.zoom - 1,
            ),
          ),
          const SizedBox(height: 6),
          _MapControlButton(
            icon: Icons.explore,
            tooltip: 'Remettre au nord',
            onPressed: () => mapController.rotate(0),
          ),
        ],
      ),
    );
  }
}

class _MapControlButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _MapControlButton({
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
