import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';

import 'package:vamos_cartographie/map/modes/place_origin/ui/origin_menu_widget.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/menu_button.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/overlay_menu.dart';
import 'package:vamos_cartographie/map/modes/shared/ui/trip/sheet/trip_selection_sheet.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';

class PlaceOriginUi extends ConsumerWidget {
  const PlaceOriginUi(this.mode, {super.key});
  final PlaceOriginMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) => switch (mode) {
    PlaceNewTripOrigin m => _NewTripUi(m),
    PlaceExistingTripOrigin(:final tripId) => _ExistingTripUi(mode, tripId),
  };
}

class _NewTripUi extends ConsumerWidget {
  const _NewTripUi(this.mode);
  final PlaceNewTripOrigin mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CancelBottomButton(
          tooltipText: 'Cancel creation',
          onPressed: () => ref.applyTransition(mode.cancel()),
        ),
        OverlayMenu<MapTmpOrigin>(
          builder: (_, hit) => OriginMenuWidget(
            children: [
              MenuButton(
                icon: Icons.add_location_alt_outlined,
                label: 'Start ici',
                onPressed: () => ref.applyTransition(mode.validate(hit.point)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExistingTripUi extends ConsumerWidget {
  const _ExistingTripUi(this.mode, this.tripId);
  final PlaceOriginMode mode;
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TripSelectionSheet(tripId: tripId, canEdit: true),
        OverlayMenu<MapTripOrigin>(
          builder: (_, hit) => OriginMenuWidget(
            children: [
              MenuButton(
                icon: Icons.route,
                label: 'start route',
                onPressed: () =>
                    ref.applyTransition(SketchEdition.startFromOrigin(hit)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
