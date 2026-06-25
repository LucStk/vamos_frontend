import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/commands/trip_provider.dart';
import 'package:vamos_cartographie/core/injection/stores/trip_store.dart';
import 'package:vamos_cartographie/features/trips/dialogs/trip_creator_dialog.dart';
import 'package:vamos_cartographie/features/trips/widgets/explorer_empty_view.dart';
import 'package:vamos_cartographie/features/trips/widgets/explorer_error_view.dart';
import 'package:vamos_cartographie/features/trips/widgets/trip_card.dart';

class ExplorerPage extends ConsumerWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadState = ref.watch(loadTripsProvider);
    final tripStore = ref.watch(tripStoreProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(loadTripsProvider),
          ),
        ],
      ),
      body: loadState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ExplorerErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(loadTripsProvider),
        ),
        data: (_) => tripStore.store.isEmpty
            ? const ExplorerEmptyView()
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: tripStore.store.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final trip = tripStore.store.values.elementAt(index);
                  return TripCard(tripId: trip.id);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => TripCreatorDialog.show(context),
        icon: const Icon(Icons.add),
        label: const Text('Nouveau voyage'),
      ),
    );
  }
}
