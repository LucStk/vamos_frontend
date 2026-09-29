import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/features/explore_map/presentation/bottom_sheet/bottom_sheet.dart';

class TripInfoBar extends StatelessWidget {
  final Trip trip;
  const TripInfoBar({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(radius: 18, child: Icon(Icons.person, size: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 4,
                ), // Petit espace entre le titre et la capsule
                // Création de la capsule
                ProfileCapsule(userId: trip.ownerId),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
