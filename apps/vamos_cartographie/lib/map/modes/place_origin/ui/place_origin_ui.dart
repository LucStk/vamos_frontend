import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';

import 'package:vamos_cartographie/map/modes/place_origin/ui/origin_menu_widget.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/menu_button.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/overlay_menu.dart';
import 'package:vamos_cartographie/map/modes/place_origin/ui/trip_title_dialog.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/toolbox.dart';

class PlaceOriginUi extends ConsumerWidget {
  const PlaceOriginUi(this.mode, {super.key});
  final PlaceOriginMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) => switch (mode) {
    PlaceNewTripOrigin m => _NewTripUi(m),
    PlaceExistingTripOrigin(:final tripId) => _ExistingTripUi(mode, tripId),
  };
}

/// Création d'un voyage : barre de recherche (un résultat pose le départ) et
/// panneau pour valider le départ.
class _NewTripUi extends ConsumerWidget {
  const _NewTripUi(this.mode);
  final PlaceNewTripOrigin mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final origin = ref.watch(modeSlotProvider(tripOriginSlot));

    return Stack(
      fit: StackFit.expand,
      children: [
        SearchTopSheet(onPicked: mode.placeAt),
        Toolbox(
          items: const [],
          activeIndex: null,
          onSelect: (_) {},
          leading: BackTab(onTap: () => ref.applyTransition(mode.cancel())),
          panel: ToolPanel(
            hint: origin == null
                ? 'Touchez la carte ou cherchez un lieu pour poser le départ.'
                : 'Déplacez le point pour ajuster le départ.',
            primary: ToolAction(
              icon: Icons.add_location_alt_outlined,
              label: 'Commencer ici',
              onPressed: origin == null
                  ? null
                  : () => _validate(context, ref, origin.point),
            ),
          ),
        ),
      ],
    );
  }

  /// Le titre se demande après le choix du point ; refermer le dialog laisse
  /// le point en place sans créer le voyage.
  Future<void> _validate(
    BuildContext context,
    WidgetRef ref,
    WorldOffset origin,
  ) async {
    final title = await showTripTitleDialog(context);
    if (title == null) return;
    ref.applyTransition(mode.validate(origin, title: title));
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
        // TripSelectionSheet(tripId: tripId, canEdit: true),
        OverlayMenu<MapTripStart>(
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
