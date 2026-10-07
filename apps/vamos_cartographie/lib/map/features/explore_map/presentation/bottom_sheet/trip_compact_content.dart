// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

import '/domain_features/stored_file/presentation/carousel_view.dart';
import '/routing/routing.dart';
import '/map/injection/map_scene.dart';
import "/map/injection/map_gesture_handler.dart";
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([mapScene, MapGestureHandlerNotifier])
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
            onPressed: () {
              TripRoute(tripId: trip.id.value).go(context);
            },
            icon: const Icon(Icons.map_sharp, size: 16),
            label: const Text('Ouvrir'),
          ),
        ],
      ),
    );
  }
}
