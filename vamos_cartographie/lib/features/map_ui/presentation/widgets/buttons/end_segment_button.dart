import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

class EndSegmentButton extends ConsumerWidget {
  final Id<Vertex> vertexId;
  final TripId tripId;
  const EndSegmentButton({
    super.key,
    required this.tripId,
    required this.vertexId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed:
          () {}, //TODO => mapCtrl.dispatch(OpenEditWaypointDialog(waypointId)),
      style: FilledButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.stop_circle, size: 30),
    );
  }
}
