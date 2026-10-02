// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

class TripCompactContent extends StatelessWidget {
  final Trip trip;
  const TripCompactContent({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    // Coupe l'excédent visuel sans jamais permettre de scroller.
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          ImageCarouselView(id: trip.id),
          const Spacer(),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.map_sharp, size: 16),
            label: const Text('Ouvrir'),
          ),
        ],
      ),
    );
  }
}
