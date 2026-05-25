import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import '../editors/trip_editor.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:vamos_cartographie/shared/shared.dart';
import "package:vamos_cartographie/features/trips/presentation/providers/trips_providers.dart";

/// Dialog de création d'un nouveau voyage.
/// Affiche un TripInfoEditor sur un Trip vide.
/// À la confirmation : crée le voyage via le repository et retourne l'id.
class TripCreatorDialog extends ConsumerWidget {
  const TripCreatorDialog({super.key});

  static void show(BuildContext context) {
    showDialog(context: context, builder: (_) => const TripCreatorDialog());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editorKey = GlobalKey<TripInfoEditorState>();

    return DialogShell(
      content: TripInfoEditor(
        key: editorKey,
        initialTrip: Trip(waypoints: [], segments: []),
      ),

      buttonsBuilder: (ctx) => [
        ConfirmButton(
          onPressed: () async {
            final trip = editorKey.currentState?.currentTrip;

            if (trip == null) return;

            try {
              await ref.read(tripsProvider.notifier).createTrip(trip);

              if (!context.mounted) return;

              Navigator.of(context).pop();
            } catch (e) {
              if (!context.mounted) return;

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(e.toString())));
            }
          },
        ),
      ],
    );
  }
}
