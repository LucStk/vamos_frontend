import 'package:flutter/material.dart';

class SimpleBottomSheetShell extends StatelessWidget {
  final Widget content;
  const SimpleBottomSheetShell({super.key, required this.content});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ), // Pour matcher le look de Waypoint
        child: Material(
          elevation: 8,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: Theme.of(context).canvasColor, // Ou Colors.white
          child: SafeArea(
            top:
                false, // Évite d'ajouter du padding en haut, juste en bas pour les encoches
            child: Padding(padding: const EdgeInsets.all(16.0), child: content),
          ),
        ),
      ),
    );
  }
}
