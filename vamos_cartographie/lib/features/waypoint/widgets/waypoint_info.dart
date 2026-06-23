import "package:flutter/material.dart";
import "waypoint_header.dart";
import "/features/waypoint/domain/waypoint_ui.dart";

class WaypointInfo extends StatelessWidget {
  final Waypoint waypoint;
  final VoidCallback? onEdit;
  const WaypointInfo({super.key, required this.waypoint, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Titre mis en valeur ──
                if (waypoint.title.isNotEmpty)
                  Text(
                    waypoint.title,
                    textAlign: TextAlign
                        .center, // Aligne le texte au milieu sur l'axe X
                    style: const TextStyle(
                      fontSize: 24, // Rend le texte Grand
                      fontWeight: FontWeight.bold, // Rend le texte en Gras
                      color:
                          Colors.black, // Optionnel : une couleur bien visible
                    ),
                  ),

                const SizedBox(height: 16),
                WaypointHeader(type: waypoint.categoryUi),
                const SizedBox(height: 16),

                // Photos
                ImageCarouselView(remoteImages: waypoint.images),

                // Description (Ici ta syntaxe avec ...[ ] était déjà correcte !)
                if (waypoint.description.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    waypoint.description,
                    style: const TextStyle(
                      fontSize: 14, // Taille de la police
                      height:
                          1.5, // Hauteur de ligne (interligne) pour une meilleure lisibilité
                      color: Colors
                          .black87, // Un noir légèrement adouci, plus agréable à lire
                    ),
                    textAlign: TextAlign
                        .justify, // Optionnel : pour justifier le texte comme dans un livre
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
