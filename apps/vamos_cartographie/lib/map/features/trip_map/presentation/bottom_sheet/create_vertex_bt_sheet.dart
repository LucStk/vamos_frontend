import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/domain_features/trip/injection/trip_store.dart';
import '../../../../overlay_ui/simple_bottom_sheet_shell.dart';
import '../../../explore_map/presentation/sheet/trip_form_sheet.dart';

// + import de tripStoreProvider et de showTripFormSheet

class CreateVertexBottomSheet extends ConsumerWidget {
  const CreateVertexBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleBottomSheetShell(
      content: IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Créer un voyage',
        onPressed: () => {},
      ),
    );
  }
}

Future<void> _createAndOpenTrip(BuildContext context, WidgetRef ref) async {
  final store = ref.read(tripStoreProvider.notifier);

  final result = await store.createBlankTrip();
  final trip = result.fold((_) => null, (trip) => trip);
  // En cas d'échec, l'ErrorHandler a déjà notifié l'utilisateur.
  if (trip == null || !context.mounted) return;

  final saved = await showTripFormSheet(
    context,
    trip: trip,
    title: 'Nouveau voyage',
  );

  // Création annulée : on ne laisse pas un voyage vide traîner.
  if (!saved) {
    await store.deleteTrip(trip.id); // à adapter à ton API
  }
}
