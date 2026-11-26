import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Le voyage n'a encore que son départ : de quoi le déplacer, ou commencer à
/// tracer depuis lui.
///
/// Posé au-dessus du dock, qu'il laisse intact : on peut toujours quitter le
/// voyage et ouvrir sa fiche. Toucher la carte pose le curseur, dont le
/// panneau propose alors d'aller jusqu'au point touché.
@Dependencies([modeSelection, ModeMachine])
class TripOriginPanel extends ConsumerWidget {
  const TripOriginPanel({super.key, required this.mode});

  final TripReadyMode mode;

  void _sketch(WidgetRef ref) {
    final origin = ref
        .read(routeStoreProvider(mode.tripId))
        .route
        ?.current
        .startPoint;
    if (origin == null) return;
    final point = ref.read(mapCameraProvider).latLngToWorldOffset(origin);
    ref.applyTransition(mode.sketchFromOrigin(point));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            12,
            0,
            12,
            TripReadyDock.clearance + 12,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
            child: Material(
              elevation: kSheetElevation,
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ToolPanel(
                  hint:
                      'Ce voyage n’a que son départ. Tracez depuis lui, ou '
                      'touchez la carte pour aller jusqu’à un point.',
                  secondary: ToolAction(
                    icon: Icons.open_with,
                    label: 'Déplacer le départ',
                    onPressed: () => ref.applyTransition(mode.moveOrigin),
                  ),
                  primary: ToolAction(
                    icon: Icons.draw,
                    label: 'Tracer depuis',
                    onPressed: () => _sketch(ref),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
