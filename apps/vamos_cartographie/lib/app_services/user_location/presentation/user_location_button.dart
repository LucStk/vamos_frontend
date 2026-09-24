import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app_services/app_services.dart';
import 'package:vamos_cartographie/app_services/user_location/presentation/user_location_icons.dart';

class UserLocationButton extends ConsumerWidget {
  const UserLocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLocationProvider);

    final notifier = ref.read(userLocationProvider.notifier);

    return IconButton(
      icon: userLocation.iconWidget,
      color: userLocation.color,
      onPressed: () => switch (userLocation) {
        UserPositionInactive _ => notifier.start(),
        _ => notifier.stop(),
      },
    );
  }
}
