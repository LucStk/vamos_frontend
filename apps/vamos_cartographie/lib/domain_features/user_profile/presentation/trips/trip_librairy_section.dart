import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_data_loader.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/user_trips_provider.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/trip_library.dart';

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
    final load = ref.watch(loadUserTripsProvider(userId)); // statut
    final trips = ref.watch(userTripSummariesProvider(userId)); // données

    return TripLibrary(
      trips: trips,
      isLoading: load.isLoading,
      hasError: load.hasError,
      onRetry: () => ref.invalidate(loadUserTripsProvider(userId)),
      onOpenTrip: onOpenTrip,
      onCreateTrip: onCreateTrip,
    );
  }
}
