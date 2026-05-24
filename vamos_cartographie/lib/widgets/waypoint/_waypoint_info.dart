import "package:flutter/material.dart";

import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import "_waypoint_header.dart";

import '../text_area_counter.dart';

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
                // CORRECTION ICI : Pas d'accolades, pas de virgule de fin après le bloc
                if (waypoint.title != null) Text(waypoint.title!),

                const SizedBox(height: 16),
                WaypointHeader(type: waypoint.type),
                const SizedBox(height: 16),

                // Photos
                ImageCarouselPicker(
                  remoteImages: waypoint.images ?? [],
                  readOnly: true,
                  onChanged: (_) {},
                ),

                // Description (Ici ta syntaxe avec ...[ ] était déjà correcte !)
                if (waypoint.description != null &&
                    waypoint.description!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    waypoint.description!,
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
