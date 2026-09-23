import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/map/layers/layers.dart';
import 'user_location_icons.dart';
import 'widgets/widgets.dart';
import '/app_services/app_services.dart';
import '/map/engine/engine.dart';

/// Boutons de contrôle de la carte : zoom +/- et remise au nord.

class MapControls extends ConsumerWidget {
  const MapControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(mapCameraHolderProvider);
    print("mapControl rebuild");

    final userLocation = ref.watch(userLocationProvider);
    final activeOverlays = ref.watch(activeNetworkOverlaysProvider);

    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          ...[
            MapControlButton(
              icon: CupertinoIcons.add,
              tooltip: 'Zoom avant',
              onPressed: () => camera.zoomIn(),
            ),
            const SizedBox(height: 6),
            MapControlButton(
              icon: CupertinoIcons.minus,
              tooltip: 'Zoom arrière',
              onPressed: () => camera.zoomOut(),
            ),
            const SizedBox(height: 6),
            StreamBuilder<double>(
              stream: camera.rotationStream,
              initialData: camera.rotation,
              builder: (context, snapshot) {
                final rotation = snapshot.data ?? 0;
                if (rotation == 0) return const SizedBox.shrink();
                return IconButton(
                  icon: Transform.rotate(
                    angle: rotation * (3.14159 / 180),
                    child: const Icon(CupertinoIcons.location_north_fill),
                  ),
                  onPressed: () => camera.rotateTo(0),
                );
              },
            ),
          ],
          IconButton(
            icon: userLocation.iconWidget,
            color: userLocation.color,
            onPressed: () => ref.read(userLocationProvider.notifier).start(),
          ),
          _OverlayToggle(
            type: NetworkOverlayType.cycling,
            icon: Icons.pedal_bike,
            isActive: activeOverlays.contains(NetworkOverlayType.cycling),
          ),
          _OverlayToggle(
            type: NetworkOverlayType.hiking,
            icon: CupertinoIcons.person_alt,
            isActive: activeOverlays.contains(NetworkOverlayType.hiking),
          ),
          _OverlayToggle(
            type: NetworkOverlayType.rail,
            icon: CupertinoIcons.train_style_one,
            isActive: activeOverlays.contains(NetworkOverlayType.rail),
          ),
        ],
      ),
    );
  }
}

class _OverlayToggle extends ConsumerWidget {
  final NetworkOverlayType type;
  final IconData icon;
  final bool isActive;

  const _OverlayToggle({
    required this.type,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(icon),
      color: isActive
          ? CupertinoColors.activeBlue
          : CupertinoColors.inactiveGray,
      onPressed: () =>
          ref.read(activeNetworkOverlaysProvider.notifier).toggle(type),
    );
  }
}
