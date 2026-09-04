import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/canvas//markers/user_location_marker.dart';
import 'package:vamos_cartographie/user_location/user_location_provider.dart';

class UserLocationLayer extends ConsumerWidget {
  const UserLocationLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(userLocationProvider.select((m) => m.position));

    if (position == null) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [
        Marker(
          point: position,
          width: 40,
          height: 40,
          child: const UserLocationMarker(),
        ),
      ],
    );
  }
}
