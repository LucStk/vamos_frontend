// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_view.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/header/trip_header.dart';

class TripViewerContent extends StatelessWidget {
  final Trip trip;

  // On ajoute une ValueKey pour que l'AnimatedSwitcher repère le changement
  const TripViewerContent({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    // Retrait du Padding horizontal ici car il est déjà géré par le parent WaypointBottomSheetContent
    return Column(
      key: const ValueKey('full_content'), // 👈 CRUCIAL pour AnimatedSwitcher
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TripHeader(title: trip.title),
        const SizedBox(height: 16),
        ImageCarouselView(id: trip.id),
        if (trip.description.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            trip.description,
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ],
    );
  }
}
