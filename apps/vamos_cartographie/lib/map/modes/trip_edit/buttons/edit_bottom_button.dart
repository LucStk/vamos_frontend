import 'package:flutter/material.dart';

class EditBottomButton extends StatelessWidget {
  const EditBottomButton({
    super.key,
    required this.onPressed,
    required this.tooltipText,
  });

  final VoidCallback onPressed;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: FilledButton.tonalIcon(
          onPressed: onPressed,
          icon: Icon(Icons.route, size: 18, color: scheme.primary),
          label: Text(tooltipText),
          style: FilledButton.styleFrom(
            backgroundColor: scheme.surfaceContainerHigh,
            foregroundColor: scheme.onSurface,
            elevation: 1,
            shadowColor: Colors.black.withValues(alpha: 0.25),
            minimumSize: const Size(0, 40),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            textStyle: theme.textTheme.labelLarge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: scheme.outlineVariant),
            ),
          ),
        ),
      ),
    );
  }
}
