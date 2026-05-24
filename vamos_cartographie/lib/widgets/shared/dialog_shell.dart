import 'package:flutter/material.dart';

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
            // ── Structure Principale du Dialog ──
            Column(
              mainAxisSize: MainAxisSize.min, // S'adapte au contenu si petit
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 32,
                ), // Espace pour ne pas chevaucher la croix
                // 1. Zone de contenu SCROLLABLE uniquement
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: content,
                  ),
                ),

                // 2. Zone de BOUTONS STATIQUES toujours en bas
                if (buttons != null && buttons!.isNotEmpty) ...[
                  const Divider(
                    height: 1,
                  ), // Optionnel : une fine ligne de séparation
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .end, // Aligne les boutons à droite (standard)
                      children: buttons!,
                    ),
                  ),
                ],
              ],
            ),

            // ── Bouton de fermeture en haut à droite ──
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
                splashRadius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
