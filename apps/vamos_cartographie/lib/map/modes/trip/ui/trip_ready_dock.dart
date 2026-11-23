import 'package:flutter/material.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/dock_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Les trois boutons de la lecture d'un trip, en bas de l'écran : retour à
/// gauche, fiche du voyage au milieu, édition à droite (propriétaire
/// seulement). Dans une journée, celui de droite passe au jour suivant.
///
/// Ils ne sont là que si aucune fiche n'est ouverte. Seul le dialog du voyage
/// les laisse : son bouton devient alors la croix qui le ferme.
class TripReadyDock extends StatelessWidget {
  const TripReadyDock({
    super.key,
    required this.mode,
    required this.onBack,
    required this.onInfo,
    required this.onEdit,
    this.infoOpen = false,
    this.dayMode = false,
    this.onNextDay,
  });

  /// Hauteur à laisser libre au-dessus du dock (bouton, marges, un peu d'air).
  static const clearance = DockButton.size + 12 + 8;

  /// La fiche du voyage est ouverte : le bouton du milieu la ferme.
  final bool infoOpen;

  /// Une journée (ou l'un de ses morceaux / waypoints) est ouverte : le
  /// bouton de droite passe au jour suivant au lieu de modifier le voyage.
  final bool dayMode;

  /// Va au jour suivant ; null : pas de jour suivant, le bouton est inactif.
  final VoidCallback? onNextDay;

  final TripReadyMode mode;
  final VoidCallback onBack;
  final VoidCallback onInfo;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
          child: SizedBox(
            height: DockButton.size,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: DockButton(
                    icon: Icons.adaptive.arrow_back,
                    tooltip: 'Retour',
                    onPressed: onBack,
                  ),
                ),
                Align(
                  child: DockButton(
                    icon: infoOpen ? Icons.close : Icons.info_outline,
                    tooltip: infoOpen ? 'Fermer' : 'Informations du voyage',
                    onPressed: onInfo,
                  ),
                ),
                if (dayMode)
                  Align(
                    alignment: Alignment.centerRight,
                    child: DockButton(
                      icon: Icons.adaptive.arrow_forward,
                      tooltip: 'Jour suivant',
                      onPressed: onNextDay,
                    ),
                  )
                else if (!mode.readOnly)
                  Align(
                    alignment: Alignment.centerRight,
                    child: DockButton(
                      icon: Icons.route,
                      tooltip: 'Modifier le voyage',
                      onPressed: onEdit,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
