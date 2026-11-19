import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_store.dart';
import 'package:vamos_cartographie/map/entities/common/overview/entity_overview_compact.dart';

class WaypointOverviewCompact extends ConsumerWidget {
  const WaypointOverviewCompact({
    super.key,
    required this.waypoint,
    required this.tripId,
    this.editable = false,
  });

  final WaypointFields waypoint;
  final TripId tripId;
  final bool editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    return EntityOverviewCompact(
      title: waypoint.title,
      ownerId: waypoint.id,
      canEdit: editable,
      leading: CircleAvatar(
        radius: 14,
        backgroundColor: scheme.primaryContainer,
        // TODO: icône propre à waypoint.poiCategory.
        child: Icon(Icons.place, size: 16, color: scheme.onPrimaryContainer),
      ),
      onRename: (newTitle) async {
        ref
            .read(waypointStoreProvider(tripId).notifier)
            .updateTitle(waypoint, newTitle);
        return null;
      },
    );
  }
}
