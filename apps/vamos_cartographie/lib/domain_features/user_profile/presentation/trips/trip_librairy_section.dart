import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

import '../../providers/user_trips_provider.dart';
import 'trip_library.dart';

class TripLibrarySection extends ConsumerWidget {
  const TripLibrarySection({
    super.key,
    required this.userId,
    required this.onOpenTrip,
    required this.onCreateTrip,
  });

  final UserId userId;
  final ValueChanged<Trip> onOpenTrip;
  final VoidCallback onCreateTrip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(userTripsProvider(userId));

    return tripsAsync.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Column(
        children: [
          const Text('Impossible de charger les voyages.'),
          TextButton(
            onPressed: () => ref.invalidate(userTripsProvider(userId)),
            child: const Text('Réessayer'),
          ),
        ],
      ),
      data: (trips) => TripLibrary(
        trips: trips,
        onOpenTrip: onOpenTrip,
        onCreateTrip: onCreateTrip,
      ),
    );
  }
}
