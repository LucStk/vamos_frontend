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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Mes voyages',
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
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final columns = width >= 1000
                ? 4
                : width >= 650
                ? 3
                : width >= 340
                ? 2
                : 1;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trips.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) {
                if (index == trips.length) {
                  return CreateTripCard(onTap: onCreateTrip);
                }

                final (trip, images) = trips[index];

                return TripCard(
                  trip: trip,
                  images: images,
                  onTap: () => onOpenTrip(trip),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
