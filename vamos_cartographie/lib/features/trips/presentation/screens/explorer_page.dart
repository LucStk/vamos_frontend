import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/trips/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/map/map.dart';
import 'package:vamos_cartographie/features/trips/presentation/providers/trips_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<void> _deleteTrip(
    BuildContext context,
    WidgetRef ref,
    Trip trip,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Supprimer le voyage'),
        content: Text(
          'Voulez-vous vraiment supprimer '
          '« ${trip.title.isEmpty ? 'Sans titre' : trip.title} » ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await ref.read(tripsProvider.notifier).deleteTrip(trip.id!);

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Voyage supprimé')));
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
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
                onDelete: () => _deleteTrip(context, ref, trip),
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
