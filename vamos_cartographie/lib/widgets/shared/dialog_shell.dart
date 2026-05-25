import 'package:flutter/material.dart';
export "dialogs/dialog_errors_body.dart";
export "dialogs/dialog_loading_body.dart";

// On ajoute un type générique <T> qui représente la donnée renvoyée par le Dialog
class DialogShell<T> extends StatelessWidget {
  final Widget content;
  // Au lieu de List<Widget>?, on demande une fonction qui génère les boutons
  // et fournit le BuildContext du Dialog
  final List<Widget> Function(BuildContext dialogContext)? buttonsBuilder;
  final BoxConstraints constraints;

  const DialogShell({
    super.key,
    required this.content,
    this.buttonsBuilder, // Renommé pour clarté
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
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),

                Expanded(
                  // Attention : Ton original avait un SingleChildScrollView ICI ET dans le WaypointEditor.
                  // Laisse-le ici, et enlève-le du WaypointEditor pour éviter les conflits de scroll.
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: content,
                  ),
                ),

                // On génère les boutons dynamiquement si le builder est fourni
                if (buttonsBuilder != null) ...[
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // On passe le 'context' actuel (celui du Dialog) au builder !
                      children: buttonsBuilder!(context),
                    ),
                  ),
                ],
              ],
            ),

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
