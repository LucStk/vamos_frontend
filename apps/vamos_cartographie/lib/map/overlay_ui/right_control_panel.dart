import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import '/map/map.dart';
import '/app_services/app_services.dart';

/// Boutons de contrôle de la carte : zoom +/- et remise au nord.
@Dependencies([mapContext])
class MapControls extends ConsumerWidget {
  const MapControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOverlays = ref.watch(activeNetworkOverlaysProvider);

    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          CameraButtonsControl(),
          UserLocationButton(),
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
