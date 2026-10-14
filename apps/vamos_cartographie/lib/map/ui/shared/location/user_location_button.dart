import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app_services/app_services.dart';
import 'package:vamos_cartographie/map/ui/shared/controls/map_control_button_shell.dart';
import 'package:vamos_cartographie/map/ui/shared/location/user_location_icons.dart';

class UserLocationButton extends ConsumerWidget {
  const UserLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLocationProvider);

    final notifier = ref.read(userLocationProvider.notifier);

    return MapControlButton(
      tooltip: "geolocalisation",
      icon: userLocation.iconWidget,
      onPressed: () => switch (userLocation) {
        UserPositionInactive _ => notifier.start(),
        _ => notifier.stop(),
      },
    );
  }
}
