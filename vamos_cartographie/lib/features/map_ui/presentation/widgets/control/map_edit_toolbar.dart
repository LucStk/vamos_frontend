import 'package:flutter/material.dart';

// ── MapEditRouteBar ───────────────────────────────────────────────────────────

/// Barre d'action affichée en bas quand le mode **édition de segments** est actif.
/// Contient les boutons Save et Cancel.
class MapEditRouteBar extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const MapEditRouteBar({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withOpacity(0.97),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              // ── Annuler ──
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onCancel,
                  icon: const Icon(Icons.close, size: 18),
                  label: const Text('Annuler'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.onSurface,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // ── Sauvegarder ──
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: onSave,
                  icon: const Icon(Icons.save_outlined, size: 18),
                  label: const Text('Sauvegarder'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── MapAddPointBar ────────────────────────────────────────────────────────────

/// Barre d'action affichée en bas quand le mode **ajout de point** est actif.
/// Contient les boutons Accepter (valider le ou les points ajoutés) et Annuler.
class MapAddPointBar extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const MapAddPointBar({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withOpacity(0.97),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              // ── Annuler ──
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onCancel,
                  icon: const Icon(Icons.close, size: 18),
                  label: const Text('Annuler'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.onSurface,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // ── Accepter ──
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: onConfirm,
                  icon: const Icon(Icons.check, size: 18),
                  label: const Text('Accepter'),
                  style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── MapEditFab ────────────────────────────────────────────────────────────────

/// Bouton flottant (FAB) affiché par-dessus la carte pour activer
/// l'édition des segments. Position : haut droit sous la barre supérieure.
class MapEditFab extends StatelessWidget {
  /// true = le mode édition de route est actif (le bouton change d'apparence).
  final bool isActive;
  final VoidCallback onTap;

  const MapEditFab({super.key, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      // Positionné sous la barre supérieure (≈ 80 dp) et à droite
      top: 80,
      right: 12,
      child: Material(
        color: isActive
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.surface,
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.route,
                  size: 20,
                  color: isActive
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  isActive ? 'Route (actif)' : 'Modifier route',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isActive
                        ? theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.onSurfaceVariant,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
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

// ── MapAddPointFab ────────────────────────────────────────────────────────────

/// Bouton flottant affiché par-dessus la carte pour activer
/// l'ajout d'un point. Visible uniquement quand l'utilisateur est propriétaire.
class MapAddPointFab extends StatelessWidget {
  /// true = mode ajout de point actif.
  final bool isActive;
  final VoidCallback onTap;

  const MapAddPointFab({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      top: 130,
      right: 12,
      child: Material(
        color: isActive
            ? theme.colorScheme.secondaryContainer
            : theme.colorScheme.surface,
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isActive ? Icons.location_off : Icons.add_location_alt,
                  size: 20,
                  color: isActive
                      ? theme.colorScheme.onSecondaryContainer
                      : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  isActive ? 'Point (actif)' : 'Ajouter point',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: isActive
                        ? theme.colorScheme.onSecondaryContainer
                        : theme.colorScheme.onSurfaceVariant,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
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
