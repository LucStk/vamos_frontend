import 'package:flutter/cupertino.dart';
import 'package:trip_application/trip/trip.dart';
import 'trip_card.dart';

class MobileTripsCarousel extends StatelessWidget {
  const MobileTripsCarousel({super.key, required this.tripIds});

  final List<TripId> tripIds;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 150,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.88),
            itemCount: tripIds.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: TripCard(tripId: tripIds[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
