import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

import '/map/map.dart';
import 'package:domain_core/domain_core.dart';

class CreateWaypointButton extends ConsumerWidget {
  final Id<Trip> tripId;
  final WaypointId waypointId;
  const CreateWaypointButton({
    super.key,
    required this.tripId,
    required this.waypointId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapStateNotifier = ref.watch(mapStateProvider(tripId).notifier);
    return IconButton(
      onPressed: () =>
          mapStateNotifier.sendIntent(OpenWaypointDialog(waypointId)),
      style: FilledButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.add_location, size: 30),
    );
  }
}
