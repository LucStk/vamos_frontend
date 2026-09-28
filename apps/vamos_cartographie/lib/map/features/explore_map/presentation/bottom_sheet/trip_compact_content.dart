// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/features/explore_map/presentation/bottom_sheet/trip_header.dart';
import '/map/features/trip_map/presentation/presentation.dart';
import '/domain_features/domain_features.dart';

import '/ui_kit/ui_kit.dart';
import 'package:vamos_cartographie/map/map.dart';

class TripCompactContent extends ConsumerWidget {
  final Trip trip;

  const TripCompactContent({super.key, required this.trip});

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
            Expanded(child: TripHeader(title: trip.title)),

            const SizedBox(width: 12),

            Row(children: [

              ],
            ),
          ],
        ),
      ],
    );
  }
}
