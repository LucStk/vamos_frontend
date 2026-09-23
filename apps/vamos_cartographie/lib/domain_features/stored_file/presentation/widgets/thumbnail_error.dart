import 'package:flutter/material.dart';

class ThumbnailError extends StatelessWidget {
  final bool isRetryable;

  const ThumbnailError({super.key, this.isRetryable = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent.withValues(alpha: 0.6),
      child: InkWell(
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Error',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isRetryable) ...[
                const SizedBox(height: 2),
                const Icon(Icons.refresh, color: Colors.white, size: 22),
                const SizedBox(height: 2),
                const Text(
                  'Réessayer',
                  style: TextStyle(color: Colors.white, fontSize: 9),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
