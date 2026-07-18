import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/trip/trip.dart';

class ExplorerPage extends ConsumerStatefulWidget {
  const ExplorerPage({super.key});
  @override
  ConsumerState<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends ConsumerState<ExplorerPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tripStoreProvider.notifier).loadTrips();
    });
  }

  Future<void> _createAndOpenTrip(BuildContext context, WidgetRef ref) async {
    final result = await ref.read(tripStoreProvider.notifier).createBlankTrip();

    result.fold(
      (failure) {
        // rien à faire ici : ErrorHandler/notificationQueueProvider
        // a déjà affiché la notification globale via OptimisticExecutor
      },
      (trip) {
        if (!context.mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) =>
              TripFormDialog(initialTrip: trip, successMessage: 'Voyage créé'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripStore = ref.watch(tripStoreProvider).tripStore.store;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(tripStoreProvider.notifier).loadTrips();
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (tripStore.isEmpty) {
            return const ExplorerEmptyView();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: tripStore.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final trip = tripStore.values.elementAt(index);
              return TripCardView(tripId: trip.id);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _createAndOpenTrip(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Nouveau voyage'),
      ),
    );
  }
}
