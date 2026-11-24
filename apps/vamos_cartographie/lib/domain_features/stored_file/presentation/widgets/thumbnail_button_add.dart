import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Bouton "+"
// ─────────────────────────────────────────────────────────────────────────────

class ThumbnailButtonAdd extends StatelessWidget {
  final double size;

  const ThumbnailButtonAdd({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: scheme.outline,
            width: 1.5,
            style: BorderStyle.solid,
          ),
          color: scheme.surfaceContainerLow,
        ),
        child: Icon(
          Icons.add_photo_alternate_outlined,
          size: size * 0.4,
          color: scheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
