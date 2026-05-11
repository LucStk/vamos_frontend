import 'package:flutter/material.dart';

/// Barre supérieure de la MapPage.
/// Contient : bouton retour, titre cliquable, switch mode édition.
class MapTopBar extends StatelessWidget {
  final String title;
  final bool isEditing;
  final bool isDirty;
  final VoidCallback onBack;
  final VoidCallback onTitleTap;
  final ValueChanged<bool> onModeChanged;

  const MapTopBar({
    super.key,
    required this.title,
    required this.isEditing,
    required this.isDirty,
    required this.onBack,
    required this.onTitleTap,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasTitle = title.isNotEmpty;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withOpacity(0.95),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // ── Bouton retour ──
              IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Retour aux voyages',
                onPressed: onBack,
              ),

              // ── Titre (cliquable) ──
              Expanded(
                child: GestureDetector(
                  onTap: onTitleTap,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          hasTitle ? title : 'Nouveau voyage',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: hasTitle
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onSurface.withOpacity(0.4),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Indicateur "cliquer pour modifier"
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: theme.colorScheme.onSurface.withOpacity(0.4),
                      ),
                      const SizedBox(width: 4),
                      // Point orange si modifications non sauvegardées
                      if (isDirty)
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // ── Switch Visualisation / Édition ──
              _ModeSwitch(isEditing: isEditing, onChanged: onModeChanged),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeSwitch extends StatelessWidget {
  final bool isEditing;
  final ValueChanged<bool> onChanged;

  const _ModeSwitch({required this.isEditing, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Édition',
          style: theme.textTheme.labelSmall?.copyWith(
            color: isEditing
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface.withOpacity(0.45),
            fontWeight: isEditing ? FontWeight.w700 : FontWeight.normal,
          ),
        ),
        Switch(
          value: isEditing,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
