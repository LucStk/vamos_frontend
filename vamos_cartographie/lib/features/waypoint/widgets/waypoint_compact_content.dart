// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:trip_domain/domain/types/Ids.dart';
import 'package:vamos_cartographie/features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_header.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_viewer_actions.dart';

class WaypointCompactContent extends StatelessWidget {
  final TripId tripId;
  final Waypoint waypoint;

  const WaypointCompactContent({
    super.key,
    required this.tripId,
    required this.waypoint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(
        'compact_content',
      ), // 👈 CRUCIAL pour AnimatedSwitcher
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Glissez vers le haut pour voir les détails",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WaypointHeader(type: waypoint.poiCategoryUi),

            WaypointViewerButtons(tripId: tripId, waypoint: waypoint),
          ],
        ),
      ],
    );
  }
}
