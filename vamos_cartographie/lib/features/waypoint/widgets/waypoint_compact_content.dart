// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/waypoint/waypoint.dart';

class WaypointCompactContent extends StatelessWidget {
  final Waypoint waypoint;

  const WaypointCompactContent({super.key, required this.waypoint});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(
        'compact_content',
      ), // 👈 CRUCIAL pour AnimatedSwitcher
      mainAxisSize: MainAxisSize.min,
      children: const [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Glissez vers le haut pour voir les détails",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
