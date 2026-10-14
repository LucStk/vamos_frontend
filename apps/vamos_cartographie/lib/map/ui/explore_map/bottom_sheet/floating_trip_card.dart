import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

import 'bottom_sheet.dart';

const _cardHeight = 64.0;
const _cardMargin = 12.0;

/// Carte du haut : poussée, réduite et estompée par la sheet qui arrive.
class FloatingTripCard extends StatelessWidget {
  final Trip trip;
  final ValueListenable<double> progress;

  const FloatingTripCard({
    super.key,
    required this.trip,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: progress,
      // Construit une seule fois, réutilisé à chaque frame.
      child: Column(
        children: [
          Material(
            elevation: 6,
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: _cardHeight,
              child: TripInfoBar(trip: trip),
            ),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: ProfileCapsule(userId: trip.ownerId),
          ),
        ],
      ),
      builder: (context, p, child) => IgnorePointer(
        ignoring: p >= 0.5,
        child: Opacity(
          opacity: 1 - p,
          child: Transform.translate(
            offset: Offset(0, -_cardMargin * p),
            child: Transform.scale(scale: 1 - 0.06 * p, child: child),
          ),
        ),
      ),
    );
  }
}

/// Fait apparaître le contenu (hauteur + opacité) au fil de [progress].
class AbsorbedSlot extends StatelessWidget {
  final ValueListenable<double> progress;
  final Widget child;

  const AbsorbedSlot({super.key, required this.progress, required this.child});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: progress,
      child: child,
      builder: (context, p, child) {
        if (p <= 0) return const SizedBox.shrink();
        return ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: p,
            child: Opacity(opacity: p, child: child),
          ),
        );
      },
    );
  }
}
