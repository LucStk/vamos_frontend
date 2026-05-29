// features/map/presentation/screens/utils/map_coordinator.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

/// Ouvre les options d'édition d'un segment de trajet
// void showSegmentOptions(int segmentIndex, Trip trip) {
//   final seg = trip.segments[segmentIndex];
//   SegmentCard.show(
//     context: context,
//     segmentIndex: segmentIndex,
//     trip: trip,
//     onTypeChanged: (type) {
//       seg.type = type;
//       _notifier.setDirty(true);
//     },
//   );
// }

/// Utilitaire pour afficher les messages flash à l'écran
void showSnackBar(BuildContext context, String message, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.redAccent : Colors.green.shade600,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
