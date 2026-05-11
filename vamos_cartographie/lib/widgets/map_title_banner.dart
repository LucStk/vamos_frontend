import 'package:flutter/material.dart';

/// Bandeau titre affiché en haut de la carte.
/// Affiche le nom du voyage et un badge indiquant le mode actuel.
/// Un tap ouvre les infos du voyage.
class MapTitleBanner extends StatelessWidget {
  final String title;
  final bool isEditing;
  final VoidCallback onTap;

  const MapTitleBanner({
    super.key,
    required this.title,
    required this.isEditing,
    required this.onTap,
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
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.92),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.route, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    hasTitle ? title : 'Nouveau voyage',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: hasTitle
                          ? theme.colorScheme.onSurface
                          : Colors.grey.shade400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _ModeBadge(isEditing: isEditing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ModeBadge extends StatelessWidget {
  final bool isEditing;

  const _ModeBadge({required this.isEditing});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isEditing
            ? theme.colorScheme.primary.withOpacity(0.12)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(
          color: isEditing
              ? theme.colorScheme.primary.withOpacity(0.4)
              : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isEditing ? Icons.edit : Icons.visibility,
            size: 12,
            color: isEditing ? theme.colorScheme.primary : Colors.grey.shade500,
          ),
          const SizedBox(width: 4),
          Text(
            isEditing ? 'Édition' : 'Lecture',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isEditing
                  ? theme.colorScheme.primary
                  : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
