import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/chrome/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/buttons/edit_bottom_actions.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/buttons/edit_bottom_button.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/sheet/trip_compact_content.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/sheet/trip_stats.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/sheet/trip_viewer_content.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet_shell.dart';

@Dependencies([modeSelection, ModeMachine])
class TripEditSheets extends ConsumerWidget {
  const TripEditSheets(this.mode, {super.key});

  final TripEditMode mode;

  static const double _barHeight = 56;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripRequiredProvider(mode.tripId));

    return Stack(
      children: [
        SafeArea(
          child: Stack(
            children: [
              // Barre centrée dans l'écran
              SearchTopSheet(),

              EditBottomActions(
                bottomOffset: 650, // ← ta marge Y par rapport au bas
                spacing: 8, // ← espacement entre les boutons
                direction: Axis.horizontal, // ← ou Axis.horizontal
                children: [
                  EditBottomButton(
                    tooltipText: "Edit route",
                    onPressed: () => ref
                        .read(appModeMachineProvider.notifier)
                        .apply(Transition.to(RouteEditMode(mode.tripId))),
                  ),
                  EditBottomButton(
                    icon: Icons.add_location_alt,
                    tooltipText: "Edit Waypoints",
                    onPressed: () => ref
                        .read(appModeMachineProvider.notifier)
                        .apply(Transition.to(WaypointsEditMode(mode.tripId))),
                  ),
                ],
              ),
            ],
          ),
        ),
        DraggableBottomSheetShell(
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
        ),
      ],
    );
  }
}
