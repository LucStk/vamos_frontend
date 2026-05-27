import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../models/map_context_action.dart';
import "option_title.dart";

class MenuCard extends StatelessWidget {
  final LatLng position;
  final List<MapContextAction> options;
  final VoidCallback onClose;

  const MenuCard({
    super.key,
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
          ...options.map((opt) => OptionTile(option: opt, position: position)),
        ],
      ),
    );
  }

  String _formatCoord(double value) => value.toStringAsFixed(5);
}
