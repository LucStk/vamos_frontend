import 'package:flutter/cupertino.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:trip_application/trip_application.dart';
import '/waypoint/waypoint.dart';
import '/map/presentation/bottom_sheet/drag_handle.dart';

class WaypointBottomSheetContent extends StatelessWidget {
  final TripId tripId;
  final Waypoint waypoint;
  final ScrollController scrollController;
  final bool isAtMin; // 👈 Reçoit l'information du mode

  const WaypointBottomSheetContent({
    super.key,
    required this.tripId,
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
                ? WaypointCompactContent(waypoint: waypoint, tripId: tripId)
                : WaypointViewerContent(waypoint: waypoint),
          ),
        ],
      ),
    );
  }
}
