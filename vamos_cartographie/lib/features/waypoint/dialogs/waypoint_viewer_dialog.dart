import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/waypoint_handler.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/waypoint_ui_queries.dart';
import 'package:vamos_cartographie/features/carousel/carousel.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/waypoint/dialogs/waypoint_form_dialog.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_header.dart';

import "package:vamos_cartographie/features/shared/shared.dart";

class WaypointViewerDialog extends ConsumerWidget {
  final WaypointId waypointId;
  final TripId tripId;
  const WaypointViewerDialog({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  static void show({
    required BuildContext context,
    required WaypointId waypointId,
    required TripId tripId,
  }) {
    showDialog(
      context: context,
      builder: (_) =>
          WaypointViewerDialog(waypointId: waypointId, tripId: tripId),
    );
  }

  Future<void> _deleteWaypoint(BuildContext context, WidgetRef ref) async {
    // On appelle la méthode statique qu'on a créée au-dessus
    final confirmed = await AskConfirmDialog.show(
      context,
      "Voulez vous vraiment supprimer ce point ? Cette action est irréversible.",
    );

    // Si l'utilisateur a annulé ou cliqué à côté de la boîte de dialogue
    if (confirmed != true) return;

    try {
      // Appel à Riverpod pour supprimer dans le state / serveur
      await ref
          .read(waypointHandlerProvider(tripId))
          .deleteWaypoint(waypointId);

      // Sécurité Flutter obligatoire après un "await"
      if (!context.mounted) return;

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Waypoint supprimé avec succès')),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la suppression : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointUiProvider(waypointId));
    if (waypoint == null) {
      return const SizedBox.shrink();
    }

    return DialogShell(
      content: Column(
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
                        color: Colors
                            .black, // Optionnel : une couleur bien visible
                      ),
                    ),

                  const SizedBox(height: 16),
                  WaypointHeader(type: waypoint.poiCategoryUi),
                  const SizedBox(height: 16),

                  // Photos
                  ImageCarouselView(id: waypoint.id),

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
      ),

      buttonsBuilder: (ctx) => [
        ModifierButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) =>
                  WaypointFormDialog(tripId: tripId, initialWaypoint: waypoint),
            );
          },
        ),

        const SizedBox(width: 8),

        DeleteButton(
          onPressed: () {
            _deleteWaypoint(context, ref);
          },
        ),
      ],
    );
  }
}
