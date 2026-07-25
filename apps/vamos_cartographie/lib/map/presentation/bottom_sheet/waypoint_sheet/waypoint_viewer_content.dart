// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'waypoint_header.dart';
import 'package:vamos_cartographie/stored_file/stored_file.dart';
import 'package:vamos_cartographie/waypoint/presentation/presentation.dart';

class WaypointViewerContent extends StatelessWidget {
  final WaypointFields waypoint;

  // On ajoute une ValueKey pour que l'AnimatedSwitcher repère le changement
  const WaypointViewerContent({super.key, required this.waypoint});

  @override
  Widget build(BuildContext context) {
    // Retrait du Padding horizontal ici car il est déjà géré par le parent WaypointBottomSheetContent
    return Column(
      key: const ValueKey('full_content'), // 👈 CRUCIAL pour AnimatedSwitcher
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WaypointHeader(type: waypoint.poiCategoryUi),
        const SizedBox(height: 16),
        ImageCarouselView(id: waypoint.id),
        if (waypoint.description.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            waypoint.description,
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ],
    );
  }
}
