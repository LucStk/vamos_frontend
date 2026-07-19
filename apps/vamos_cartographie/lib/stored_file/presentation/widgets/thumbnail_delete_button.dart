import 'package:flutter/material.dart';

class ThumbnailDeleteButton extends StatelessWidget {
  const ThumbnailDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Le Positioned a été retiré d'ici
    return Container(
      padding: const EdgeInsets.all(
        2,
      ), // Optionnel: pour donner de l'espace à l'icône
      decoration: const BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.close, color: Colors.white, size: 14),
    );
  }
}
