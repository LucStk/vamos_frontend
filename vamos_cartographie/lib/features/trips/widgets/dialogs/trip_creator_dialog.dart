import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/trip_handler.dart';
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

    return FutureBuilder<Either<Failure, Trip>>(
      future: futurNewTrip,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(Exception("Cannot create New Trip"));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return snapshot.data!.fold(
          (f) => ErrorWidget(Exception("Cannot create New Trip")),
          (data) {
            return TripFormDialog(
              initialTrip: data,
              successMessage: 'Voyage créé',
            );
          },
        );
      },
    );
  }
}
