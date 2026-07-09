import 'package:flutter/cupertino.dart';
import 'package:vamos_cartographie/features/waypoint/domain/ext_waypoint_poi.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/bottom_sheet/drag_handle.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_compact_content.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_viewer_content.dart';

class WaypointBottomSheetContent extends StatelessWidget {
  final Waypoint waypoint;
  final ScrollController scrollController;
  final bool isAtMin; // 👈 Reçoit l'information du mode

  const WaypointBottomSheetContent({
    super.key,
    required this.waypoint,
    required this.scrollController,
    required this.isAtMin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        controller: scrollController,
        // AnimatedSwitcher permet une transition visuelle douce (fondu)
        // entre le mode compact et le mode complet au lieu d'un saut brutal
        children: [
          const DragHandle(),
          const SizedBox(height: 8),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isAtMin
                ? WaypointCompactContent(waypoint: waypoint)
                : WaypointViewerContent(waypoint: waypoint),
          ),
        ],
      ),
    );
  }
}
