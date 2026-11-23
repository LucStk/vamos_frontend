import 'package:flutter/material.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/dock_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Les trois boutons de la lecture d'un trip, en bas de l'écran : retour à
/// gauche, fiche du voyage au milieu, édition à droite (propriétaire
/// seulement). Dans une journée, ceux des côtés mènent au jour précédent et
/// au jour suivant.
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
    this.editIcon = Icons.route,
    this.editTooltip = 'Modifier le voyage',
    this.onPreviousDay,
    this.onNextDay,
  });

  /// Hauteur à laisser libre au-dessus du dock (bouton, marges, un peu d'air).
  static const clearance = DockButton.size + 12 + 8;

  /// La fiche du voyage est ouverte : le bouton du milieu la ferme.
  final bool infoOpen;

  /// Une journée (ou l'un de ses morceaux) est ouverte : le bouton de gauche
  /// mène au jour précédent (au lieu de quitter) et celui de droite au jour
  /// suivant (au lieu de modifier le voyage).
  final bool dayMode;

  /// Va au jour précédent ; null : il n'y en a pas, le bouton est absent.
  final VoidCallback? onPreviousDay;

  /// Va au jour suivant ; null : il n'y en a pas, le bouton est absent.
  final VoidCallback? onNextDay;

  final TripReadyMode mode;
  final VoidCallback onBack;
  final VoidCallback onInfo;
  final VoidCallback onEdit;

  /// Icône et libellé du bouton de droite (hors jour) : modifier le voyage, ou
  /// l'étape ouverte.
  final IconData editIcon;
  final String editTooltip;

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
                if (!dayMode)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DockButton(
                      icon: Icons.adaptive.arrow_back,
                      tooltip: 'Retour',
                      onPressed: onBack,
                    ),
                  )
                else if (onPreviousDay != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DockButton(
                      icon: Icons.adaptive.arrow_back,
                      tooltip: 'Jour précédent',
                      onPressed: onPreviousDay,
                    ),
                  ),
                Align(
                  child: DockButton(
                    icon: infoOpen ? Icons.close : Icons.info_outline,
                    tooltip: infoOpen ? 'Fermer' : 'Informations du voyage',
                    onPressed: onInfo,
                  ),
                ),
                if (dayMode) ...[
                  if (onNextDay != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: DockButton(
                        icon: Icons.adaptive.arrow_forward,
                        tooltip: 'Jour suivant',
                        onPressed: onNextDay,
                      ),
                    ),
                ] else if (!mode.readOnly)
                  Align(
                    alignment: Alignment.centerRight,
                    child: DockButton(
                      icon: editIcon,
                      tooltip: editTooltip,
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
