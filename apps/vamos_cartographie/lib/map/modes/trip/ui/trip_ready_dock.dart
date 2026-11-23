import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/dock_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// Un bouton du dock : son icône, son libellé et ce qu'il fait.
typedef DockAction = ({IconData icon, String tooltip, VoidCallback onPressed});

/// Les boutons de la lecture d'un trip, en bas de l'écran : à gauche, un
/// retour (à la carte, ou d'un niveau : morceau → jour, étape → jour) ou le
/// jour précédent ; au milieu, la fiche du voyage (la croix qui la ferme quand
/// elle est ouverte) ; à droite, le jour suivant ou le déplacement d'une étape.
///
/// Chaque côté est absent quand son action est nulle. Ne connaît ni les modes
/// ni les sélections : le parent décide de ce que chaque bouton fait.
class TripReadyDock extends StatelessWidget {
  const TripReadyDock({
    super.key,
    required this.onInfo,
    this.infoOpen = false,
    this.left,
    this.right,
  });

  /// Hauteur à laisser libre au-dessus du dock (bouton, marges, un peu d'air).
  static const clearance = DockButton.size + 12 + 8;

  /// Fiche du voyage : son icône au repos.
  static const infoIcon = Icons.auto_stories_rounded;

  /// Une fiche est ouverte : le bouton du milieu la ferme.
  final bool infoOpen;
  final VoidCallback onInfo;

  final DockAction? left;
  final DockAction? right;

  Widget _button(DockAction a) =>
      DockButton(icon: a.icon, tooltip: a.tooltip, onPressed: a.onPressed);

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
                if (left case final a?)
                  Align(alignment: Alignment.centerLeft, child: _button(a)),
                Align(
                  child: DockButton(
                    icon: infoOpen ? Icons.close : infoIcon,
                    tooltip: infoOpen ? 'Fermer' : 'Informations du voyage',
                    onPressed: onInfo,
                  ),
                ),
                if (right case final a?)
                  Align(alignment: Alignment.centerRight, child: _button(a)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
