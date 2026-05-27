import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/map/map.dart';
import 'package:vamos_cartographie/features/trips/presentation/providers/trips_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:vamos_cartographie/features/trips/presentation/widgets/dialogs/dialogs.dart";

class ExplorerPage extends ConsumerWidget {
  const ExplorerPage({super.key});

  void _openTrip(BuildContext context, Trip trip) {
    TripViewerDialog.show(
      context: context,
      tripData: trip,
      onExplore: () async {
        await Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => MapPage(tripId: trip.id)));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(tripsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(tripsProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: tripsAsync.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, _) {
          return ExplorerErrorView(
            message: error.toString(),
            onRetry: () {
              ref.read(tripsProvider.notifier).refresh();
            },
          );
        },

        data: (trips) {
          if (trips.isEmpty) {
            return const ExplorerEmptyView();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: trips.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),

            itemBuilder: (context, index) {
              final trip = trips[index];

              return TripCard(
                trip: trip,
                onTap: () => _openTrip(context, trip),
              );
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
