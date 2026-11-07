import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/create_trip_card.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/trip_card.dart';

class TripLibrary extends StatelessWidget {
  /// Lecture seule : on peut uniquement ouvrir un voyage.
  const TripLibrary.viewer({
    super.key,
    required this.trips,
    required this.onOpenTrip,
    this.isLoading = false,
    this.hasError = false,
    this.onRetry,
  }) : onCreateTrip = null,
       onDeleteTrip = null;

  /// Édition : ouvrir, créer et supprimer.
  const TripLibrary.editor({
    super.key,
    required this.trips,
    required this.onOpenTrip,
    required this.onCreateTrip,
    required this.onDeleteTrip,
    this.isLoading = false,
    this.hasError = false,
    this.onRetry,
  });

  final List<TripSummary> trips;
  final bool isLoading;
  final bool hasError;
  final VoidCallback? onRetry;
  final ValueChanged<Trip> onOpenTrip;
  final VoidCallback? onCreateTrip;
  final ValueChanged<TripId>? onDeleteTrip;

  bool get _canEdit => onCreateTrip != null || onDeleteTrip != null;

  @override
  Widget build(BuildContext context) {
    final showEmptyMessage =
        trips.isEmpty && !isLoading && !hasError && !_canEdit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _TripLibraryHeader(
          count: trips.length,
          isLoading: isLoading,
          hasError: hasError,
          onRetry: onRetry,
        ),
        const SizedBox(height: 16),
        if (showEmptyMessage)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: Text('Aucun voyage pour l\'instant.')),
          )
        else
          _TripGrid(
            trips: trips,
            onOpenTrip: onOpenTrip,
            onCreateTrip: onCreateTrip,
            onDeleteTrip: onDeleteTrip,
          ),
      ],
    );
  }
}

class _TripLibraryHeader extends StatelessWidget {
  const _TripLibraryHeader({
    required this.count,
    required this.isLoading,
    required this.hasError,
    this.onRetry,
  });

  final int count;
  final bool isLoading;
  final bool hasError;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // Pas de compteur trompeur ("0 voyage") tant que rien n'est chargé.
    final showCount = !(isLoading && count == 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text('Voyages', style: textTheme.titleLarge)),
            if (showCount)
              Text(
                '$count voyage${count > 1 ? 's' : ''}',
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
      ],
    );
  }
}

class _TripGrid extends StatelessWidget {
  const _TripGrid({
    required this.trips,
    required this.onOpenTrip,
    this.onCreateTrip,
    this.onDeleteTrip,
  });

  final List<TripSummary> trips;
  final ValueChanged<Trip> onOpenTrip;
  final VoidCallback? onCreateTrip;
  final ValueChanged<TripId>? onDeleteTrip;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        const targetCardWidth = 180.0;
        const cardAspectRatio = 0.78; // largeur / hauteur

        // Au moins 2 colonnes, plus si l'écran est large (tablette, desktop).
        final columns =
            ((constraints.maxWidth + spacing) / (targetCardWidth + spacing))
                .floor()
                .clamp(2, 6);
        final cardWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        final cardHeight = cardWidth / cardAspectRatio;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            if (onCreateTrip != null)
              SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: CreateTripCard(onTap: onCreateTrip!),
              ),
            for (final summary in trips)
              SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: TripCard(
                  tripSummary: summary,
                  onTap: () => onOpenTrip(summary.trip),
                  onDelete: onDeleteTrip == null
                      ? null
                      : () => onDeleteTrip!(summary.trip.id),
                ),
              ),
          ],
        );
      },
    );
  }
}
