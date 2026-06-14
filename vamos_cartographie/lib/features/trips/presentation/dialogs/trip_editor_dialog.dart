import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/trips/application/providers/trips_notifier.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import "trip_form_dialog.dart";

import 'package:vamos_cartographie/features/shared/shared.dart';

class TripEditorDialog extends ConsumerWidget {
  final Id<Trip> tripId;

  const TripEditorDialog({super.key, required this.tripId});

  static void show({required BuildContext context, required Id<Trip> tripId}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => TripEditorDialog(tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripsProvider.notifier).get(tripId);

    if (trip == null) {
      return const DialogErrorBody(errorMessage: 'Voyage introuvable');
    }

    return TripFormDialog(
      initialTrip: trip.toDraft(),
      successMessage: 'Voyage mis à jour',
      onSubmit: (ref, editedTrip) async {
        await ref.read(tripsProvider.notifier).updateTrip(tripId, editedTrip);
      },
    );
  }
}
