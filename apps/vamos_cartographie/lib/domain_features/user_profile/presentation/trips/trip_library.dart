import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/create_trip_card.dart';
import 'package:vamos_cartographie/map/ui/features/trip/card/trip_card.dart';

class TripLibrary extends StatelessWidget {
  const TripLibrary({
    super.key,
    required this.trips,
    required this.onOpenTrip,
    required this.onCreateTrip,
    this.isLoading = false,
    this.hasError = false,
    this.onRetry,
  });

  final List<TripSummary> trips;
  final bool isLoading;
  final bool hasError;
  final VoidCallback? onRetry;
  final ValueChanged<Trip> onOpenTrip;
  final VoidCallback onCreateTrip;

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 180.0;
    const double cardAspectRatio = 0.68;
    const double cardHeight = cardWidth / cardAspectRatio;

    final textTheme = Theme.of(context).textTheme;
    // Pas de compteur trompeur ("0 voyage") tant que rien n'est chargé.
    final showCount = !(isLoading && trips.isEmpty);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text('Voyages', style: textTheme.titleLarge)),
            if (showCount)
              Text(
                '${trips.length} voyage${trips.length > 1 ? 's' : ''}',
                style: textTheme.bodySmall,
              ),
          ],
        ),
        const SizedBox(height: 8),

        if (isLoading) const LinearProgressIndicator(),
        if (hasError)
          Row(
            children: [
              const Expanded(child: Text('Impossible de charger les voyages.')),
              TextButton(onPressed: onRetry, child: const Text('Réessayer')),
            ],
          ),

        const SizedBox(height: 16),

        Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: CreateTripCard(onTap: onCreateTrip),
              ),
              for (final summary in trips)
                SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: TripCard(
                    tripSummary: summary,
                    onTap: () => onOpenTrip(summary.trip),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
