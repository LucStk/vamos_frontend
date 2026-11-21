import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

// Adaptez au nouvel emplacement du menu (entities/route/menus/).

/// Actions de l'outil « tracé », construites avec [ToolPanel].
class SketchActions extends StatelessWidget {
  const SketchActions({
    super.key,
    required this.mobilityType,
    required this.onMobilityTypeChanged,
    required this.eraseSketch,
    required this.validateSketch,
    required this.routingSketch,
    required this.isSketchRouted,
    required this.routingFailed,
  });

  final MobilityType mobilityType;
  final ValueChanged<MobilityType> onMobilityTypeChanged;
  final VoidCallback eraseSketch;
  final VoidCallback validateSketch;
  final VoidCallback routingSketch;
  final bool isSketchRouted;
  final bool routingFailed;

  @override
  Widget build(BuildContext context) => ToolPanel(
    settings: [
      // MobilityTypeMenu(
      //   selected: mobilityType,
      //   onChanged: onMobilityTypeChanged,
      // ),
    ],
    trailing: [
      ToolAction(
        icon: Icons.backspace_outlined,
        label: 'Effacer le tracé',
        destructive: true,
        onPressed: eraseSketch,
      ),
    ],
    secondary: ToolAction(
      icon: routingFailed ? Icons.refresh : Icons.alt_route,
      label: routingFailed ? 'Réessayer' : 'Router',
      error: routingFailed,
      onPressed: routingSketch,
    ),
    primary: ToolAction(
      icon: Icons.check,
      label: isSketchRouted ? 'Valider' : 'Valider à main levée',
      onPressed: validateSketch,
    ),
  );
}
