import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/trips/application/providers/trips_notifier.dart';
import "trip_form_dialog.dart";

import 'package:vamos_cartographie/shared/widgets/widgets.dart';

class TripEditorDialog extends ConsumerWidget {
  final int tripId;

  const TripEditorDialog({super.key, required this.tripId});

  static void show({required BuildContext context, required int tripId}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => TripEditorDialog(tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripAsync = ref.watch(tripProvider(tripId));

    return tripAsync.when(
      loading: () => const DialogLoadingBody(),

      error: (e, st) => DialogErrorBody(errorMessage: e.toString()),

      data: (trip) {
        if (trip == null) {
          return const DialogErrorBody(errorMessage: 'Voyage introuvable');
        }

        return TripFormDialog(
          initialTrip: trip.toDraft(),

          successMessage: 'Voyage mis à jour',

          onSubmit: (ref, editedTrip) async {
            await ref
                .read(tripsProvider.notifier)
                .updateTrip(tripId, editedTrip);
          },
        );
      },
    );
  }
}
