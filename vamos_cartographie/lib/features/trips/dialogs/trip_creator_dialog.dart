import 'package:flutter/material.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/commands.dart/trip_provider.dart';
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

      onSubmit: (ref, TripDraft trip) async {
        await ref.read(tripHandlerProvider).createTrip(trip);
      },
    );
  }
}
