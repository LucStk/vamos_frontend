import 'package:flutter/material.dart';

/// Colonne de boutons flottants de la MapPage.
/// Contient le bouton retour, le toggle mode, et les boutons d'édition.
class MapFabColumn extends StatelessWidget {
  final bool isEditing;
  final bool isAddingPoint;
  final VoidCallback onToggleMode;
  final VoidCallback onToggleAddPoint;
  final VoidCallback onSave;
  final VoidCallback onReload;
  final VoidCallback onBack;

  const MapFabColumn({
    super.key,
    required this.isEditing,
    required this.isAddingPoint,
    required this.onToggleMode,
    required this.onToggleAddPoint,
    required this.onSave,
    required this.onReload,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Retour vers l'explorateur
        FloatingActionButton(
          heroTag: 'explorer',
          tooltip: 'Retour aux voyages',
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          foregroundColor: theme.colorScheme.onSurfaceVariant,
          onPressed: onBack,
          child: const Icon(Icons.list),
        ),
        const SizedBox(height: 12),

        // Toggle mode observateur / éditeur
        FloatingActionButton(
          heroTag: 'mode',
          tooltip: isEditing
              ? 'Passer en mode lecture'
              : 'Passer en mode édition',
          backgroundColor: isEditing
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHighest,
          foregroundColor: isEditing
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurfaceVariant,
          onPressed: onToggleMode,
          child: Icon(isEditing ? Icons.edit : Icons.visibility),
        ),

        // Boutons visibles uniquement en mode éditeur
        if (isEditing) ...[
          const SizedBox(height: 12),

          // Toggle ajout de point
          FloatingActionButton(
            heroTag: 'add',
            tooltip: isAddingPoint
                ? 'Arrêter l\'ajout de points'
                : 'Ajouter des points',
            backgroundColor: isAddingPoint
                ? theme.colorScheme.tertiary
                : theme.colorScheme.secondaryContainer,
            foregroundColor: isAddingPoint
                ? theme.colorScheme.onTertiary
                : theme.colorScheme.onSecondaryContainer,
            onPressed: onToggleAddPoint,
            child: Icon(
              isAddingPoint ? Icons.location_off : Icons.add_location_alt,
            ),
          ),
          const SizedBox(height: 12),

          // Sauvegarde
          FloatingActionButton(
            heroTag: 'save',
            tooltip: 'Sauvegarder',
            onPressed: onSave,
            child: const Icon(Icons.save),
          ),
          const SizedBox(height: 12),

          // Recharger
          FloatingActionButton(
            heroTag: 'load',
            tooltip: 'Recharger depuis le serveur',
            onPressed: onReload,
            child: const Icon(Icons.folder_open),
          ),
        ],
      ],
    );
  }
}
