import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import '/map/map.dart';

/// Boutons de contrôle de la carte : zoom +/- et remise au nord.
class MapControls extends ConsumerWidget {
  const MapControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mapControllerProvider);
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
