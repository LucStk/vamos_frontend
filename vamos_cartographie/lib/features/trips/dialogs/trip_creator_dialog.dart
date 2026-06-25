import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/commands/trip_provider.dart';
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
    final futurNewTrip = ref.read(tripHandlerProvider).createBlankTrip();

    return FutureBuilder<Trip>(
      future: futurNewTrip,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(Exception("Cannot create New Trip"));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return TripFormDialog(
          initialTrip: snapshot.data!,
          successMessage: 'Voyage créé',
          onSubmit: (ref, Trip trip) async {},
        );
      },
    );
  }
}
