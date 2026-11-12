import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_data_loader.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/user_trips_provider.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/trip_library.dart';

class UserTripLibrary extends ConsumerWidget {
  /// Lecture seule : ouvrir uniquement.
  const UserTripLibrary.viewer({
    super.key,
    required this.userId,
    required this.onOpenTrip,
  }) : onCreateTrip = null,
       onDeleteTrip = null;

  /// Édition : ouvrir, créer, supprimer.
  const UserTripLibrary.editor({
    super.key,
    required this.userId,
    required this.onOpenTrip,
    required this.onCreateTrip,
    required this.onDeleteTrip,
  });

  final UserId userId;
  final ValueChanged<Trip> onOpenTrip;
  final VoidCallback? onCreateTrip;
  final ValueChanged<TripId>? onDeleteTrip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final load = ref.watch(loadUserTripsProvider(userId));
    final trips = ref.watch(userTripSummariesProvider(userId));
    void retry() => ref.invalidate(loadUserTripsProvider(userId));

    final onCreate = onCreateTrip;
    final onDelete = onDeleteTrip;

    if (onCreate != null && onDelete != null) {
      return TripLibrary.editor(
        trips: trips,
        isLoading: load.isLoading,
        hasError: load.hasError,
        onRetry: retry,
        onOpenTrip: onOpenTrip,
        onCreateTrip: onCreate,
        onDeleteTrip: onDelete,
      );
    }

    return TripLibrary.viewer(
      trips: trips,
      isLoading: load.isLoading,
      hasError: load.hasError,
      onRetry: retry,
      onOpenTrip: onOpenTrip,
    );
  }
}
