import 'package:flutter/material.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/map.dart';
// + import de tripStoreProvider et de showTripFormSheet

class CreateTripBottomSheet extends ConsumerWidget {
  const CreateTripBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleBottomSheetShell(
      content: IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Créer un voyage',
        onPressed: () => _createAndOpenTrip(context, ref),
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
