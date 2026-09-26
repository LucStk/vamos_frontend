import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/map.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([
  mapGestureHandler,
  userLocationTrigger,
  cameraDirector,
  tripEditorScene,
  MapEditor,
  mapCamera,
  MapCameraChanges,
  mapCameraSnapshot,
])
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
      ref.read(loadTripsProvider);
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
              ref.read(loadTripsProvider);
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
