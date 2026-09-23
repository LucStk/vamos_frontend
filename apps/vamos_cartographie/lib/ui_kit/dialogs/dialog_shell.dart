import 'package:flutter/material.dart';
export "dialog_errors_body.dart";
export "dialog_loading_body.dart";

class DialogShell<T> extends StatelessWidget {
  final Widget content;
  final List<Widget> Function(BuildContext dialogContext)? buttonsBuilder;
  final BoxConstraints constraints;
  final VoidCallback? onClose;

  const DialogShell({
    super.key,
    required this.content,
    this.buttonsBuilder,
    this.constraints = const BoxConstraints(maxWidth: 480, maxHeight: 600),
    this.onClose,
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
                // Étape C : Si onClose est fourni, on l'appelle, sinon pop() classique
                onPressed: onClose ?? () => Navigator.of(context).pop(),
                splashRadius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
