import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/presentation/providers/trips_providers.dart';
import "trip_form_dialog.dart";

class TripCreatorDialog extends StatelessWidget {
  const TripCreatorDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const TripCreatorDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TripFormDialog(
      initialTrip: Trip(waypoints: [], segments: []),

      successMessage: 'Voyage créé',

      onSubmit: (ref, trip) async {
        await ref.read(tripsProvider.notifier).createTrip(trip);
      },
    );
  }
}
