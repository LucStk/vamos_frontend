import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/commands.dart/trip_provider.dart';
import "trip_form_dialog.dart";

class TripCreatorDialog extends ConsumerWidget {
  const TripCreatorDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const TripCreatorDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On génére un trip à compléter
    final futurNewTrip = ref.read(tripHandlerProvider).createBlankTrip();
    futurNewTrip.then(
      (newTrip) {
        return TripFormDialog(
          initialTrip: newTrip, //Doit créer un Trip avant
          successMessage: 'Voyage créé',
          onSubmit: (ref, Trip trip) async {},
        );
      },
      onError: (error) {
        return ErrorWidget(Exception("Cannot creat New Waypoint"));
      },
    );
    return CircularProgressIndicator();
  }
}
