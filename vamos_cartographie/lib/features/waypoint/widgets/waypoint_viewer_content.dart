// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/carousel/carousel.dart';
import 'package:vamos_cartographie/features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_header.dart';

/// Contenu "pur" de la visionneuse de waypoint : titre, header, carousel
/// de photos, description. Ne sait rien de la façon dont il est présenté
/// (Dialog, BottomSheet, ou autre) : il n'a ni scroll, ni padding
/// horizontal, ni bouton fermer — c'est le rôle du shell qui l'englobe
/// (DialogShell, BottomSheetShell...).
///
/// C'est volontairement un widget "dumb" (juste des données en entrée) :
/// pas de ref.watch ici, pour qu'il reste utilisable partout, y compris
/// dans des previews/tests sans provider.
///
/// Usage :
/// ```dart
/// DialogShell(
///   content: WaypointViewerContent(waypoint: waypoint),
///   buttonsBuilder: ...,
/// );
///
/// BottomSheetShell(
///   content: WaypointViewerContent(waypoint: waypoint),
///   buttonsBuilder: ...,
/// );
/// ```
class WaypointViewerContent extends StatelessWidget {
  final Waypoint waypoint;

  const WaypointViewerContent({super.key, required this.waypoint});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),

        // ── Titre mis en valeur ──
        if (waypoint.title.isNotEmpty)
          Text(
            waypoint.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

        const SizedBox(height: 16),
        WaypointHeader(type: waypoint.poiCategoryUi),
        const SizedBox(height: 16),

        // Photos
        ImageCarouselView(id: waypoint.id),

        // Description
        if (waypoint.description.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            waypoint.description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
        ],

        const SizedBox(height: 16),
      ],
    );
  }
}
