import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/overview/entity_overview_compact.dart';

class WaypointOverviewCompact extends ConsumerWidget {
  const WaypointOverviewCompact({
    super.key,
    required this.waypoint,
    this.editable = false,
  });

  final WaypointFields waypoint;
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
        // TODO: brancher sur ton store de waypoints, par exemple :
        // ref.read(waypointStoreProvider.notifier).update(
        //   WaypointPatchModel.fromFields(waypoint).copyWith(title: newTitle),
        // );
        return null;
      },
    );
  }
}
