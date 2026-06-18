import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/trips/application/command_handlers/trip_handler.dart';
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
      initialTrip: TripDraft(),

      successMessage: 'Voyage créé',

      onSubmit: (ref, trip) async {
        await ref.read(tripHandlerProvider.notifier).createTrip(trip);
      },
    );
  }
}
