import 'package:flutter/material.dart';

class ThumbnailError extends StatelessWidget {
  const ThumbnailError({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. On remplace le ColoredBox par un widget Material pour que l'effet d'encre (InkWell) s'affiche par-dessus
    return Material(
      color: Colors.redAccent.withValues(alpha: 0.6),
      child: InkWell(
        // 3. Optionnel : On peut personnaliser la couleur de l'ondulation pour qu'elle ressorte bien sur le rouge
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Error',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Icon(Icons.refresh, color: Colors.white, size: 22),
              SizedBox(height: 2),
              Text(
                'Réessayer',
                style: TextStyle(color: Colors.white, fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
