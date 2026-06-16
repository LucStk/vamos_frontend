import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/map/application/providers/pop_up_provider.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';

class PopupLayer extends ConsumerWidget {
  const PopupLayer({super.key, required this.tripId});

  final Id<Trip> tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popup = ref.watch(mapPopupProvider(tripId));

    if (popup == null) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [Marker(point: popup.latLng, child: popup.popMenu)],
    );
  }
}
