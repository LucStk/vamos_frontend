import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';

/// Barre supérieure de la MapPage.
/// Contient un bouton retour en capsule et un titre centré et ajusté.
class MapTopBar extends ConsumerWidget {
  const MapTopBar({super.key});

  void _onBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tripId = ref.watch(currentTripIdProvider);
    final mapState = ref.watch(mapStateProvider(tripId));
    final title = "test title"; //mapState.currentTrip.title;

    // Style commun pour les ombres des capsules flottantes
    final boxShadow = [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        blurRadius: 8,
        offset: const Offset(0, 3),
      ),
    ];

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
          child: SizedBox(
            height: 48, // Hauteur fixe pour aligner le bouton et le titre
            child: Stack(
              alignment: Alignment.center,
              children: [
                // ── BOUTON RETOUR (Capsule blanche à gauche) ──
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Capsule blanche forcée
                      shape: BoxShape.circle,
                      boxShadow: boxShadow,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: theme.colorScheme.onSurface,
                      ),
                      tooltip: 'Retour aux voyages',
                      onPressed: () => _onBack(context),
                    ),
                  ),
                ),

                // ── TITRE (Conteneur ajusté au centre) ──
                // En utilisant un Container sans contrainte de largeur dans un Stack centré,
                // il va s'ajuster au pixel près à la taille du texte.
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  constraints: const BoxConstraints(
                    maxWidth: 1020,
                  ), // Sécurité pour les longs titres
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(
                      24,
                    ), // Effet pilule / capsule
                    boxShadow: boxShadow,
                  ),
                  child: Text(
                    title.isNotEmpty ? title : 'Nouveau voyage',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: title.isNotEmpty
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onSurface.withOpacity(0.4),
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
