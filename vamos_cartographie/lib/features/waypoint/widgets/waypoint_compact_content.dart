// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/bottom_sheet/drag_handle.dart';

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
class WaypointCompactContent extends StatelessWidget {
  final Waypoint waypoint;

  const WaypointCompactContent({super.key, required this.waypoint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // 👈 Étape 3 : Remplacer Column par ListView et lier le controller
      child: const Column(
        children: [
          SizedBox(height: 8),
          Center(
            child: Text(
              "Glissez vers le haut pour voir les détails",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
