import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';

import 'package:vamos_cartographie/map/modes/place_origin/ui/trip_title_dialog.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/edit_dock.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/toolbox.dart';

class PlaceOriginUi extends ConsumerWidget {
  const PlaceOriginUi(this.mode, {super.key});
  final PlaceOriginMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) => switch (mode) {
    PlaceNewTripOrigin m => _NewTripUi(m),
    PlaceExistingTripOrigin m => _ExistingTripUi(m),
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
          onClose: () => ref.applyTransition(mode.cancel()),
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

/// Déplacer le départ d'un voyage : le point suit le doigt, et un résultat de
/// recherche l'envoie à l'adresse choisie. On en sort par « Terminer », qui
/// ramène à la lecture du voyage.
class _ExistingTripUi extends ConsumerWidget {
  const _ExistingTripUi(this.mode);
  final PlaceExistingTripOrigin mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void done() => ref.applyTransition(mode.back);

    return Stack(
      fit: StackFit.expand,
      children: [
        SearchTopSheet(onPicked: mode.placeAt),
        EditDock(
          panelKey: 'move-origin',
          panel: ToolPanel(
            hint: 'Glissez sur la carte pour déplacer le départ.',
            primary: ToolAction(
              icon: Icons.check,
              label: 'Terminer',
              onPressed: done,
            ),
          ),
          onBack: done,
          onClose: done,
        ),
      ],
    );
  }
}
