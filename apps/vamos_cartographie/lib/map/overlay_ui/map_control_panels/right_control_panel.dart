import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/map/features/network_overlay_type.dart';
import 'package:vamos_cartographie/map/injection/network_overlay_provider.dart';
import 'package:vamos_cartographie/user_location/user_location_provider.dart';
import '/map/map.dart';

/// Boutons de contrôle de la carte : zoom +/- et remise au nord.
class MapControls extends ConsumerWidget {
  const MapControls({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(mapStateProvider(tripId).notifier);
    final userLocation = ref.watch(userLocationProvider);
    final activeOverlays = ref.watch(activeNetworkOverlaysProvider);
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
          IconButton(
            icon: Icon(userLocation.status.icon),
            color: userLocation.status.color,
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

extension UserLocationStatusExtension on UserLocationStatus {
  IconData get icon {
    switch (this) {
      case UserLocationStatus.inactive:
        return Icons.location_off;

      case UserLocationStatus.active:
        return Icons.location_on;

      case UserLocationStatus.unavailable:
        return Icons.location_disabled;
    }
  }

  Color get color {
    switch (this) {
      case UserLocationStatus.inactive:
        return CupertinoColors.inactiveGray;

      case UserLocationStatus.active:
        return CupertinoColors.activeBlue;

      case UserLocationStatus.unavailable:
        return CupertinoColors.systemRed;
    }
  }
}
