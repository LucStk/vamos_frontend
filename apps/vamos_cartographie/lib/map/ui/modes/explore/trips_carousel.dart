import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/ui/features/trip/card/trip_card.dart';

@Dependencies([])
class TripsCarouselWidget extends ConsumerWidget {
  const TripsCarouselWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripIds = ref.watch(
      tripStoreProvider.select((s) => s.tripStore.getIds()),
    );

    if (tripIds.isEmpty) {
      return const SizedBox.shrink();
    }
    return SafeArea(
      child: SizedBox(
        width: 320,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,
          clipBehavior: Clip.antiAlias,
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: tripIds.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final tripSummary = ref.watch(
                tripSummaryProvider(tripIds[index]),
              );

              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: TripCard(tripSummary: tripSummary, onTap: () {}),
              );
            },
          ),
        ),
      ),
    );
  }
}
