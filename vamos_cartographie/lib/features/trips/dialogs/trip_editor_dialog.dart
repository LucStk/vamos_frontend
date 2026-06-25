import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/entities/trip.dart';
import 'package:vamos_cartographie/core/injection/commands/trip_provider.dart';
import 'package:vamos_cartographie/core/injection/queries/trip_domain_queries.dart';
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
    final trip = ref.read(tripProvider(tripId));

    if (trip == null) {
      return const DialogErrorBody(errorMessage: 'Voyage introuvable');
    }

    return TripFormDialog(
      initialTrip: trip,
      successMessage: 'Voyage mis à jour',
      onSubmit: (ref, Trip editedTrip) async {
        await ref.read(tripHandlerProvider).updateTrip(editedTrip);
      },
    );
  }
}
