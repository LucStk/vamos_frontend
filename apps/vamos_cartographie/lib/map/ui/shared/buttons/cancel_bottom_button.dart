import 'package:flutter/material.dart';

class CancelBottomButton extends StatelessWidget {
  const CancelBottomButton({
    super.key,
    required this.onPressed,
    required this.tooltipText,
  });

  final VoidCallback onPressed;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final error = scheme.error;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.22),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: error.withValues(alpha: 0.35),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton.filled(
            onPressed: onPressed,
            style: IconButton.styleFrom(
              backgroundColor: error,
              foregroundColor: scheme.onError,
              fixedSize: const Size(62, 62),
              side: BorderSide(
                color: scheme.onError.withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
            icon: const Icon(Icons.close, size: 24),
            tooltip: tooltipText,
          ),
        ),
      ),
    );
  }
}
