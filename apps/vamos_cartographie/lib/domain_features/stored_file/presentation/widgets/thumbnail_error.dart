import 'package:flutter/material.dart';

class ThumbnailError extends StatelessWidget {
  final bool isRetryable;

  const ThumbnailError({super.key, this.isRetryable = false});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: scheme.error.withValues(alpha: 0.6),
      child: InkWell(
        splashColor: scheme.onError.withValues(alpha: 0.24),
        highlightColor: scheme.onError.withValues(alpha: 0.1),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Error',
                style: TextStyle(
                  color: scheme.onError,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isRetryable) ...[
                const SizedBox(height: 2),
                Icon(Icons.refresh, color: scheme.onError, size: 22),
                const SizedBox(height: 2),
                Text(
                  'Réessayer',
                  style: TextStyle(color: scheme.onError, fontSize: 9),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
