import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import '/map/map.dart';

/// Boutons de contrôle de la carte : zoom +/- et remise au nord.
class MapControls extends ConsumerWidget {
  const MapControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animatedController = ref.watch(animatedMapControllerProvider);
    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          MapControlButton(
            icon: CupertinoIcons.add,
            tooltip: 'Zoom avant',
            onPressed: () => animatedController.animatedZoomIn(),
          ),
          const SizedBox(height: 6),
          MapControlButton(
            icon: CupertinoIcons.minus,
            tooltip: 'Zoom arrière',
            onPressed: () => animatedController.animatedZoomOut(),
          ),
          const SizedBox(height: 6),
          StreamBuilder<MapEvent>(
            stream: animatedController.mapController.mapEventStream,
            builder: (context, _) {
              final rotation = animatedController.mapController.camera.rotation;
              if (rotation == 0) return const SizedBox.shrink();
              return IconButton(
                icon: Transform.rotate(
                  angle: rotation * (3.14159 / 180),
                  child: const Icon(CupertinoIcons.location_north_fill),
                ),
                onPressed: () => animatedController.animatedRotateTo(0),
              );
            },
          ),
        ],
      ),
    );
  }
}
