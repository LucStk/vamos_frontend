import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/trip_handler.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/trip_store.dart';
import '/features/trips/widgets/widgets.dart';

class ExplorerPage extends ConsumerStatefulWidget {
  const ExplorerPage({super.key});

  @override
  ConsumerState<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends ConsumerState<ExplorerPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(tripHandlerProvider).loadFromRemote();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final loadState = ref.watch(loadTripsProvider);
    final tripStore = ref.watch(tripStoreProvider);

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
      body: Builder(
        builder: (context) {
          if (tripStore.store.isEmpty) {
            return const ExplorerEmptyView();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: tripStore.store.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final trip = tripStore.store.values.elementAt(index);
              return TripCard(tripId: trip.id);
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => TripCreatorDialog.show(context),
        icon: const Icon(Icons.add),
        label: const Text('Nouveau voyage'),
      ),
    );
  }
}
