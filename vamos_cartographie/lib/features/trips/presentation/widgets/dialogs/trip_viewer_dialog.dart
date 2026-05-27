import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import '../editors/trip_info_view.dart';
import 'package:vamos_cartographie/shared/shared.dart';
import "package:vamos_cartographie/features/trips/presentation/providers/trips_providers.dart";
import "trip_editor_dialog.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TripViewerDialog extends ConsumerWidget {
  final Trip tripData;
  final VoidCallback onExplore;

  const TripViewerDialog({
    super.key,
    required this.tripData,
    required this.onExplore,
  });

  static void show({
    required BuildContext context,
    required Trip tripData,
    required VoidCallback onExplore,
  }) {
    showDialog(
      context: context,
      builder: (_) =>
          TripViewerDialog(tripData: tripData, onExplore: onExplore),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(tripsProvider);

    return tripsAsync.when(
      loading: () => const DialogLoadingBody(),

      error: (error, _) {
        return DialogErrorBody(errorMessage: error.toString());
      },

      data: (trips) {
        final trip = trips.firstWhere((t) => t.id == tripData.id);

        return DialogShell(
          content: TripInfoView(trip: trip),

          buttonsBuilder: (ctx) => [
            ModifierButton(
              onPressed: () async {
                Navigator.of(context).pop();

                await Future.delayed(Duration.zero);

                if (!context.mounted) return;

                TripEditorDialog.show(context: context, tripId: trip.id!);
              },
            ),

            const SizedBox(width: 8),

            ExploreButton(
              onPressed: () {
                Navigator.of(context).pop();

                onExplore();
              },
            ),
          ],
        );
      },
    );
  }
}
