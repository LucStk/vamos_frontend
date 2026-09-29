// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import '/domain_features/domain_features.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import '/ui_kit/ui_kit.dart';
import 'package:vamos_cartographie/map/map.dart';

@Dependencies([MapEditor])
class WaypointCompactContent extends ConsumerWidget {
  final TripId tripId;
  final WaypointFields waypoint;

  const WaypointCompactContent({
    super.key,
    required this.tripId,
    required this.waypoint,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

            Row(
              children: [
                DrawSegmentButton(vertexId: waypoint.vertexId, tripId: tripId),
                const SizedBox(width: 8),
                ModifierButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => WaypointFormDialog(
                        tripId: tripId,
                        initialWaypoint: waypoint,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                DeleteButton(
                  onPressed: () => deleteWaypointWithConfirmation(
                    context: context,
                    ref: ref,
                    tripId: tripId,
                    waypointId: waypoint.id,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
