// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/overlay_ui/bottom_sheet/drag_hint_header.dart';
import 'package:vamos_cartographie/waypoint/presentation/poi_ui.dart';
import 'waypoint_header.dart';
import 'waypoint_viewer_actions.dart';

class WaypointCompactContent extends StatelessWidget {
  final TripId tripId;
  final WaypointFields waypoint;

  const WaypointCompactContent({
    super.key,
    required this.tripId,
    required this.waypoint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('compact_content'), // CRUCIAL pour AnimatedSwitcher
      mainAxisSize: MainAxisSize.min,
      children: [
        // Indicateur visuel pour inciter au glissement vers le haut
        const DragHintHeader(),

        const SizedBox(height: 12),

        // Ligne d'en-tête + boutons d'action
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Expanded empêche le titre/catégorie de déborder sur les boutons
            Expanded(child: WaypointHeader(type: waypoint.poiCategoryUi)),

            const SizedBox(width: 12),

            // Actions (Ex: Édition, Suppression, etc.)
            WaypointViewerButtons(tripId: tripId, waypoint: waypoint),
          ],
        ),
      ],
    );
  }
}
