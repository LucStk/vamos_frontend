import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/ui_kit/theme/theme.dart';

class EndSegmentButton extends ConsumerWidget {
  final WaypointId vertexId;
  final TripId tripId;
  const EndSegmentButton({
    super.key,
    required this.tripId,
    required this.vertexId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors.of(context);
    return IconButton(
      onPressed:
          () {}, //TODO => mapCtrl.dispatch(OpenEditWaypointDialog(waypointId)),
      style: FilledButton.styleFrom(
        iconColor: colors.onSuccess,
        backgroundColor: colors.success,
      ),
      icon: const Icon(Icons.stop_circle, size: 30),
    );
  }
}
