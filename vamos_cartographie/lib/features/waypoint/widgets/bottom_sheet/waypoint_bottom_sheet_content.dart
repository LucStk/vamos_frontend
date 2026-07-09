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

  //   // ── MODE COMPACT ──
  //   Widget _buildCompactMode() {
  //     return const Center(
  //       key: ValueKey('compact'), // Clé requise pour AnimatedSwitcher
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(vertical: 8.0),
  //         child: Text(
  //           "Glissez vers le haut pour voir les détails",
  //           style: TextStyle(fontSize: 12, color: Colors.grey),
  //         ),
  //       ),
  //     );
  //   }

  //   // ── MODE COMPLET ──
  //   Widget _buildFullMode() {
  //     return Column(
  //       key: const ValueKey('full'), // Clé requise pour AnimatedSwitcher
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         WaypointHeader(type: waypoint.poiCategoryUi),
  //         const SizedBox(height: 16),
  //         ImageCarouselView(id: waypoint.id),
  //         if (waypoint.description.isNotEmpty) ...[
  //           const SizedBox(height: 12),
  //           Text(
  //             waypoint.description,
  //             style: const TextStyle(fontSize: 14, height: 1.5),
  //           ),
  //         ],
  //       ],
  //     );
  //   }
  // }
}
