import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/trip_sheet_pages.dart';

import 'package:vamos_cartographie/map/modes/place_origin/ui/trip_title_dialog.dart';
import 'package:vamos_cartographie/map/modes/shared/cursor_panel.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/toolbox.dart';

class PlaceOriginUi extends ConsumerWidget {
  const PlaceOriginUi(this.mode, {super.key});
  final PlaceOriginMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) => switch (mode) {
    PlaceNewTripOrigin m => _NewTripUi(m),
    PlaceExistingTripOrigin m => _ExistingTripUi(m, m.tripId),
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

/// Voyage qui n'a qu'un point de départ : tracer la route (le crayon apparaît
/// sur l'origine) ou consulter et compléter les infos du voyage.
class _ExistingTripUi extends ConsumerStatefulWidget {
  const _ExistingTripUi(this.mode, this.tripId);
  final PlaceExistingTripOrigin mode;
  final TripId tripId;

  @override
  ConsumerState<_ExistingTripUi> createState() => _ExistingTripUiState();
}

class _ExistingTripUiState extends ConsumerState<_ExistingTripUi> {
  /// Les infos du voyage remplacent le panneau, sans changer de mode.
  bool _showInfo = false;

  void _startRoute() {
    final origin = ref
        .read(routeStoreProvider(widget.tripId))
        .route
        ?.current
        .startPoint;
    if (origin == null) return;
    final point = ref.read(mapCameraProvider).latLngToWorldOffset(origin);
    ref.applyTransition(widget.mode.startRoute(point));
  }

  @override
  Widget build(BuildContext context) {
    final cursor = ref.watch(modeSlotProvider(searchResultMarkerSlot));

    return Stack(
      fit: StackFit.expand,
      children: [
        const SearchTopSheet(),
        if (_showInfo)
          PagedSheet(
            barLeading: BackTab(onTap: () => setState(() => _showInfo = false)),
            pages: tripSheetPages(
              ref.watch(tripRequiredProvider(widget.tripId)),
              editable: true,
            ),
          )
        else
          Toolbox(
            items: const [
              ToolboxItem(
                icon: Icons.draw_outlined,
                selectedIcon: Icons.draw,
                label: 'Tracer',
              ),
              ToolboxItem(
                icon: Icons.photo_library_outlined,
                selectedIcon: Icons.photo_library,
                label: 'Infos',
              ),
            ],
            activeIndex: null,
            onSelect: (i) =>
                i == 0 ? _startRoute() : setState(() => _showInfo = true),
            leading: BackTab(
              onTap: () => ref.applyTransition(widget.mode.back),
            ),
            panelKey: cursor == null ? 'hint' : 'cursor',
            panel: cursor == null
                ? const ToolPanel(
                    hint:
                        'Déplacez le départ si besoin, puis tracez la route '
                        'ou complétez les infos du voyage.',
                  )
                : CursorPanel(
                    tripId: widget.tripId,
                    cursor: cursor,
                    canTrace: true,
                  ),
          ),
      ],
    );
  }
}
