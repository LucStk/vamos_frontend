import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/selected_waypoint_panel.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/dock_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Déplacement d'une étape : le panneau de l'étape au-dessus d'un seul bouton,
/// la croix, au centre en bas, qui ramène à la lecture du trip.
///
/// À l'ouverture, la caméra centre l'étape à l'écran (zoom inchangé).
class MoveWaypointUi extends ConsumerStatefulWidget {
  const MoveWaypointUi(this.mode, {super.key});

  final MoveWaypointMode mode;

  @override
  ConsumerState<MoveWaypointUi> createState() => _MoveWaypointUiState();
}

class _MoveWaypointUiState extends ConsumerState<MoveWaypointUi> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final position = ref
          .read(waypointProvider(widget.mode.tripId, widget.mode.waypointId))
          .position;
      ref
          .read(cameraDirectorProvider)
          .submit(
            CameraRequest(
              PanTo(position),
              // Un choix de l'utilisateur : passe même après qu'il a bougé la
              // carte.
              priority: CameraPriority.explicit,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mode = widget.mode;

    return Stack(
      fit: StackFit.expand,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              12,
              12,
              TripReadyDock.clearance,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
                child: Material(
                  elevation: kSheetElevation,
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SelectedWaypointPanel(remove: mode.removeWaypoint()),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Le même bouton du milieu qu'en lecture : ici, la croix.
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DockButton(
                icon: Icons.close,
                tooltip: 'Terminer le déplacement',
                onPressed: () => ref.applyTransition(mode.closeTool),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
