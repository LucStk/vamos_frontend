import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:stored_file_application/stored_file_application.dart';
import "trip_card.dart";
import 'create_trip_card.dart';

class TripLibrary extends StatelessWidget {
  const TripLibrary({
    super.key,
    required this.trips,
    required this.onOpenTrip,
    required this.onCreateTrip,
  });

  final List<(Trip, List<StoredFileRemoteModel>)> trips;
  final ValueChanged<Trip> onOpenTrip;
  final VoidCallback onCreateTrip;

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 180.0;
    const double cardAspectRatio = 0.68;
    const double cardHeight = cardWidth / cardAspectRatio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Voyages',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text(
              '${trips.length} voyage${trips.length > 1 ? 's' : ''}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Align ou Center permet de centrer le bloc entier s'il y a très peu de cartes
        Align(
          alignment: Alignment.topCenter,
          child: Wrap(
            spacing: 16, // Espacement horizontal entre les cartes
            runSpacing: 16, // Espacement vertical entre les lignes
            alignment: WrapAlignment
                .center, // <-- Centre les cartes sur la dernière ligne
            children: List.generate(trips.length + 1, (index) {
              final Widget cardContent;

              if (index == 0) {
                cardContent = CreateTripCard(onTap: onCreateTrip);
              } else {
                final (trip, images) = trips[index - 1];
                cardContent = TripCard(
                  trip: trip,
                  images: images,
                  onTap: () => onOpenTrip(trip),
                );
              }

              // Fixe la taille de chaque carte car Wrap n'impose pas de contraintes de grille
              return SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: cardContent,
              );
            }),
          ),
        ),
      ],
    );
  }
}
