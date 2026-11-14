import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet_shell.dart';

@Dependencies([modeSelection, ModeMachine])
class WaypointSheets extends ConsumerWidget {
  const WaypointSheets(this.mode, {super.key});

  final TripEditMode mode;

  // static const double _barHeight = 56;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripRequiredProvider(mode.tripId));

    return DraggableBottomSheetShell(
      pages: [
        SheetPage(
          label: 'Aperçu',
          icon: Icons.photo_library_outlined,
          selectedIcon: Icons.photo_library,
          compact: TripOverviewCompact(trip: trip, editable: true),
          expanded: TripViewerContent(trip: trip, editable: true),
        ),
        SheetPage(
          label: 'Stats',
          icon: Icons.bar_chart_outlined,
          selectedIcon: Icons.bar_chart,
          compact: TripStatsCompact(trip: trip),
          expanded: TripStatsViewerContent(trip: trip),
        ),
      ],
    );
  }
}
