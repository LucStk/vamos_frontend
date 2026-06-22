import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/commands_provider.dart/trip_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_store.dart';
import 'package:vamos_cartographie/features/trips/dialogs/trip_creator_dialog.dart';
import 'package:vamos_cartographie/features/trips/widgets/explorer_empty_view.dart';
import 'package:vamos_cartographie/features/trips/widgets/explorer_error_view.dart';
import 'package:vamos_cartographie/features/trips/widgets/trip_card.dart';

class ExplorerPage extends ConsumerWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripStoreProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(tripHandlerProvider).loadFromRemote();
            },
          ),
        ],
      ),
      body: tripList.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, _) {
          return ExplorerErrorView(
            message: error.toString(),
            onRetry: () {
              ref.read(tripHandlerProvider).loadFromRemote();
            },
          );
        },

        data: (trips) {
          if (trips.isEmpty) {
            return const ExplorerEmptyView();
          }
          // debugPrint("Trips are $trips");
          final tripsList = trips.values.toList();
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: trips.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final trip = tripsList[index];
              return TripCard(tripId: trip.id);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          TripCreatorDialog.show(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Nouveau voyage'),
      ),
    );
  }
}
