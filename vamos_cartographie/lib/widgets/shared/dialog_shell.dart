import 'package:flutter/material.dart';

// ── Shell partagée ────────────────────────────────────────────────────────────

/// Enveloppe Dialog commune : titre centré, divider, contenu scrollable,
/// puis une rangée de boutons en bas.
class DialogShell extends StatelessWidget {
  final Widget content;
  final List<Widget>? buttons;
  final BoxConstraints constraints;

  const DialogShell({
    super.key,
    required this.content,
    this.buttons,
    this.constraints = const BoxConstraints(maxWidth: 480, maxHeight: 600),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: constraints,
        child: Stack(
          children: [
            // 1. Le contenu principal qui peut défiler
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 24,
                  ), // Un peu plus d'espace en haut pour ne pas chevaucher la croix
                  // ── Contenu ──
                  content,
                  const SizedBox(height: 20),
                  // ── Boutons ──
                  if (buttons != null && buttons!.isNotEmpty)
                    Row(children: buttons!),
                ],
              ),
            ),

            // 2. Le bouton de fermeture positionné en haut à droite
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
                // Optionnel : ajoute un léger effet visuel au survol si nécessaire
                splashRadius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
