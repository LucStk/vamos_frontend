import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ── MapContextMenuOption ──────────────────────────────────────────────────────

/// Définit une option affichée dans le [MapContextMenu].
///
/// Exemple d'utilisation :
/// ```dart
/// MapContextMenuOption(
///   icon: Icons.add_location_alt,
///   label: 'Créer un point',
///   onTap: (latLng) { /* … */ },
/// )
/// ```
class MapContextMenuOption {
  /// Icône affichée à gauche du label.
  final IconData icon;

  /// Libellé de l'option.
  final String label;

  /// Callback appelé avec la position géographique du menu quand l'option
  /// est sélectionnée.
  final void Function(LatLng latLng) onTap;

  /// Couleur de l'icône et du texte. Si null, utilise la couleur du thème.
  final Color? color;

  const MapContextMenuOption({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });
}

// ── MapContextMenu ────────────────────────────────────────────────────────────

/// Popup mini-menu ancré sur une position géographique de la carte.
///
/// Le menu reste fixé sur le point géographique [position] même quand
/// l'utilisateur déplace la carte, grâce au [MarkerLayer] de flutter_map.
///
/// Passe une liste de [MapContextMenuOption] pour personnaliser les actions
/// disponibles. L'option de fermeture (✕) est ajoutée automatiquement.
///
/// ### Intégration dans MapView
///
/// ```dart
/// if (_contextMenuPosition != null)
///   MapContextMenu(
///     position: _contextMenuPosition!,
///     options: [
///       MapContextMenuOption(
///         icon: Icons.add_location_alt,
///         label: 'Créer un point',
///         onTap: (ll) { … },
///       ),
///     ],
///     onClose: () => setState(() => _contextMenuPosition = null),
///   ),
/// ```
class MapContextMenu extends StatelessWidget {
  /// Position géographique où le menu est ancré.
  final LatLng position;

  /// Liste des options à afficher dans le menu.
  final List<MapContextMenuOption> options;

  /// Callback appelé lorsque l'utilisateur ferme le menu (bouton ✕).
  final VoidCallback onClose;

  const MapContextMenu({
    super.key,
    required this.position,
    required this.options,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    // On utilise un MarkerLayer flutter_map : le widget sera automatiquement
    // repositionné en pixels à chaque frame en fonction de la position
    // géographique → le menu "colle" à la carte même pendant le drag.
    return MarkerLayer(
      markers: [
        Marker(
          point: position,
          width: 200,
          // Hauteur dynamique : 44 px par option + 40 px header
          height: 40.0 + options.length * 44.0,
          // Ancrage : le bas-centre du widget pointe sur le coordonnée
          alignment: Alignment.bottomCenter,
          child: _MenuCard(
            position: position,
            options: options,
            onClose: onClose,
          ),
        ),
      ],
    );
  }
}

// ── _MenuCard ─────────────────────────────────────────────────────────────────

class _MenuCard extends StatelessWidget {
  final LatLng position;
  final List<MapContextMenuOption> options;
  final VoidCallback onClose;

  const _MenuCard({
    required this.position,
    required this.options,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(12),
      color: theme.colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── En-tête avec bouton fermer ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 4, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${_formatCoord(position.latitude)}  ${_formatCoord(position.longitude)}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Bouton ✕
                SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 16,
                    icon: Icon(
                      Icons.close,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: onClose,
                    tooltip: 'Fermer',
                  ),
                ),
              ],
            ),
          ),

          Divider(
            height: 1,
            thickness: 1,
            color: theme.colorScheme.outlineVariant,
          ),

          // ── Options ─────────────────────────────────────────────────────
          ...options.map((opt) => _OptionTile(option: opt, position: position)),
        ],
      ),
    );
  }

  String _formatCoord(double value) => value.toStringAsFixed(5);
}

// ── _OptionTile ───────────────────────────────────────────────────────────────

class _OptionTile extends StatelessWidget {
  final MapContextMenuOption option;
  final LatLng position;

  const _OptionTile({required this.option, required this.position});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = option.color ?? theme.colorScheme.onSurface;

    return InkWell(
      onTap: () => option.onTap(position),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Icon(option.icon, size: 18, color: color),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                option.label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
