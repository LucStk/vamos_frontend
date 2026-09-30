import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/overlay_ui/overlay_ui.dart';

class CreateTripBottomSheet extends StatelessWidget {
  const CreateTripBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return SimpleBottomSheetShell(
      content: IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Créer un voyage',
        onPressed: () {
          // _createAndOpenTrip();
        },
      ),
    );
  }
}

// Future<void> _createAndOpenTrip(BuildContext context, WidgetRef ref) async {
//   final result = await ref.read(tripStoreProvider.notifier).createBlankTrip();

//   result.fold(
//     (failure) {
//       // rien à faire ici : ErrorHandler/notificationQueueProvider
//       // a déjà affiché la notification globale via OptimisticExecutor
//     },
//     (trip) {
//       if (!context.mounted) return;
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (_) =>
//             TripFormDialog(initialTrip: trip, successMessage: 'Voyage créé'),
//       );
//     },
//   );
// }
