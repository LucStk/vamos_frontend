import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/map_ui/presentation/buttons/map_control_button_shell.dart';

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
          MapControlButton(
            icon: Icons.add,
            tooltip: 'Zoom avant',
            onPressed: () => mapController.move(
              mapController.camera.center,
              mapController.camera.zoom + 1,
            ),
          ),
          const SizedBox(height: 6),
          MapControlButton(
            icon: Icons.remove,
            tooltip: 'Zoom arrière',
            onPressed: () => mapController.move(
              mapController.camera.center,
              mapController.camera.zoom - 1,
            ),
          ),
          const SizedBox(height: 6),
          MapControlButton(
            icon: Icons.explore,
            tooltip: 'Remettre au nord',
            onPressed: () => mapController.rotate(0),
          ),
        ],
      ),
    );
  }
}
